Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F8ECC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 24 May 2022 01:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w2vrjO5I6nL1z60ZX52Qz3jwfnRneyYs882NZ+lLUKw=; b=Xunv63iTHLMML5kmv5PWNv03yh
	xXGfQHhki9bKwQXLHIE5lHp2u/ogx+R4MT+CUUgnUk1LD+R8eAvr8mqcu+OWpNBShn5AhFfcMxXs6
	1/lqFUzd/sgkjtdnfHHqYqHjnrQ+65Y6i3z6XgqK7eS3y4/mGGpomXktbAKtV00oWBUIXk77jdR85
	TXo9NDksI3QtraLsB+QrAciVNmQ0sMfILSThShnm6vRpeEuSKFAfSAG1BFHcFSofmJF2ESMuduxKk
	rlO217kV0sRFTMB4W8CzlZlVUNQYIc4hjeZUSdoDPCMsUuKS2oo5kUOEkiX18T71KnLvwYBFP+Ydt
	LJR433YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntJhJ-006WP8-0D; Tue, 24 May 2022 01:50:57 +0000
Received: from out30-42.freemail.mail.aliyun.com ([115.124.30.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntJhF-006WOO-C7
 for linux-riscv@lists.infradead.org; Tue, 24 May 2022 01:50:56 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400;
 MF=xianting.tian@linux.alibaba.com; NM=1; PH=DS; RN=12; SR=0;
 TI=SMTPD_---0VEFh5GV_1653357042; 
Received: from B-LB6YLVDL-0141.local(mailfrom:xianting.tian@linux.alibaba.com
 fp:SMTPD_---0VEFh5GV_1653357042) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 24 May 2022 09:50:44 +0800
Subject: Re: [PATCH] RISC-V: Add fast call path of crash_kexec()
To: paul.walmsley@sifive.com, aou@eecs.berkeley.edu, palmer@dabbelt.com,
 wangkefeng.wang@huawei.com, vitaly.wool@konsulko.com,
 rmk+kernel@armlinux.org.uk, ebiederm@xmission.com, tongtiangen@huawei.co
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 guoren@kernel.org, mick@ics.forth.gr
References: <20220515131407.946832-1-xianting.tian@linux.alibaba.com>
From: Xianting Tian <xianting.tian@linux.alibaba.com>
Message-ID: <788c0f2a-1562-b4ca-a1ca-0289032b1f8a@linux.alibaba.com>
Date: Tue, 24 May 2022 09:50:42 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220515131407.946832-1-xianting.tian@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_185053_625466_18B0CC94 
X-CRM114-Status: GOOD (  18.59  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="gbk"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

anVzdCBhIGZyaWVuZGx5IHBpbmcKCtTaIDIwMjIvNS8xNSDPws7nOToxNCwgWGlhbnRpbmcgVGlh
biDQtLXAOgo+IEN1cnJlbnRseSwgYWxtb3N0IGFsbCBhcmNocyAoeDg2LCBhcm02NCwgbWlwcy4u
Likgc3VwcG9ydCBmYXN0IGNhbGwKPiBvZiBjcmFzaF9rZXhlYygpIHdoZW4gInJlZ3MgJiYga2V4
ZWNfc2hvdWxkX2NyYXNoKCkiIGlzIHRydWUuIEJ1dAo+IFJJU0MtViBub3QsIGl0IGNhbiBvbmx5
IGVudGVyIGNyYXNoIHN5c3RlbSB2aWEgcGFuaWMoKS4gSG93ZXZlciBwYW5pYygpCj4gZG9lc24n
dCBwYXNzIHRoZSByZWdzIG9mIHRoZSByZWFsIGFjY2lkZW50IHNjZW5lIHRvIGNyYXNoX2tleGVj
KCksCj4gaXQgY2F1c2VkIHdlIGNhbid0IGdldCBhY2N1cmF0ZSBiYWNrdHJhY2UgdmlhIGdkYiwK
PiAJJCByaXNjdjY0LWxpbnV4LWdudS1nZGIgdm1saW51eCB2bWNvcmUKPiAJUmVhZGluZyBzeW1i
b2xzIGZyb20gdm1saW51eC4uLgo+IAlbTmV3IExXUCA5NV0KPiAJIzAgIGNvbnNvbGVfdW5sb2Nr
ICgpIGF0IGtlcm5lbC9wcmludGsvcHJpbnRrLmM6MjU1Nwo+IAkyNTU3ICAgICAgICAgICAgICAg
ICAgICBpZiAoZG9fY29uZF9yZXNjaGVkKQo+IAkoZ2RiKSBidAo+IAkjMCAgY29uc29sZV91bmxv
Y2sgKCkgYXQga2VybmVsL3ByaW50ay9wcmludGsuYzoyNTU3Cj4gCSMxICAweDAwMDAwMDAwMDAw
MDAwMDAgaW4gPz8gKCkKPgo+IFdpdGggdGhlIHBhdGNoIHdlIGNhbiBnZXQgdGhlIGFjY3VyYXRl
IGJhY2t0cmFjZSwKPiAJJCByaXNjdjY0LWxpbnV4LWdudS1nZGIgdm1saW51eCB2bWNvcmUKPiAJ
UmVhZGluZyBzeW1ib2xzIGZyb20gdm1saW51eC4uLgo+IAlbTmV3IExXUCA5NV0KPiAJIzAgIDB4
ZmZmZmZmZTAwMDYzYTRlMCBpbiB0ZXN0X3RocmVhZCAoZGF0YT08b3B0aW1pemVkIG91dD4pIGF0
IGRyaXZlcnMvdmlydGlvL3ZpcnRpb19tbWlvLmM6ODA2Cj4gCTgwNiAgICAgICAgICAgICAqKGlu
dCAqKXAgPSAweGRlYWQ7Cj4gCShnZGIpCj4gCShnZGIpIGJ0Cj4gCSMwICAweGZmZmZmZmUwMDA2
M2E0ZTAgaW4gdGVzdF90aHJlYWQgKGRhdGE9PG9wdGltaXplZCBvdXQ+KSBhdCBkcml2ZXJzL3Zp
cnRpby92aXJ0aW9fbW1pby5jOjgwNgo+IAkjMSAgMHgwMDAwMDAwMDAwMDAwMDAwIGluID8/ICgp
Cj4KPiBUZXN0IGNvZGUgdG8gcHJvZHVjZSBOVUxMIGFkZHJlc3MgZGVyZWZlcmVuY2UsCj4gCStl
eHRlcm4gaW50IHBhbmljX29uX29vcHM7Cj4gCStzdGF0aWMgc3RydWN0IHRhc2tfc3RydWN0ICpr
Owo+IAkrc3RhdGljIGludCB0ZXN0X3RocmVhZCh2b2lkICpkYXRhKSB7Cj4gCSsKPiAJKyAgICAg
ICB2b2lkICpwID0gTlVMTDsKPiAJKwo+IAkrICAgICAgIHdoaWxlICghcGFuaWNfb25fb29wcykK
PiAJKyAgICAgICAgICAgICAgIG1zbGVlcCgyMDAwKTsKPiAJKwo+IAkrICAgICAgICooaW50ICop
cCA9IDB4ZGVhZDsKPiAJKwo+IAkrICAgICAgIHJldHVybiAwOwo+IAkrfQo+IAkrCj4gCSBzdGF0
aWMgaW50IF9faW5pdCB2aXJ0aW9fbW1pb19pbml0KHZvaWQpCj4gCSB7Cj4gCSsgICAgICAgayA9
IGt0aHJlYWRfcnVuKHRlc3RfdGhyZWFkLCBOVUxMLCAidGVzdF90aHJlYWQiKTsKPiAJKyAgICAg
ICBpZiAoSVNfRVJSKGspKQo+IAkrICAgICAgICAgICAgICAgcHJfZXJyKCJDb3VsZG4ndCBjcmVh
dGUgdGVzdCBrdGhyZWFkXG4iKTsKPiAJKwo+IAkgICAgICAgIHJldHVybiBwbGF0Zm9ybV9kcml2
ZXJfcmVnaXN0ZXIoJnZpcnRpb19tbWlvX2RyaXZlcik7Cj4gCSB9Cj4KPiBTaWduZWQtb2ZmLWJ5
OiBYaWFudGluZyBUaWFuIDx4aWFudGluZy50aWFuQGxpbnV4LmFsaWJhYmEuY29tPgo+IC0tLQo+
ICAgYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyB8IDQgKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBz
LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4gaW5kZXggZmU5MmUxMTllNmEzLi5lNjY2
ZWJmYTJhNjQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+ICsrKyBi
L2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKPiBAQCAtMTYsNiArMTYsNyBAQAo+ICAgI2luY2x1
ZGUgPGxpbnV4L21tLmg+Cj4gICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4gICAjaW5jbHVk
ZSA8bGludXgvaXJxLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9rZXhlYy5oPgo+ICAgCj4gICAjaW5j
bHVkZSA8YXNtL2FzbS1wcm90b3R5cGVzLmg+Cj4gICAjaW5jbHVkZSA8YXNtL2J1Zy5oPgo+IEBA
IC00NCw2ICs0NSw5IEBAIHZvaWQgZGllKHN0cnVjdCBwdF9yZWdzICpyZWdzLCBjb25zdCBjaGFy
ICpzdHIpCj4gICAKPiAgIAlyZXQgPSBub3RpZnlfZGllKERJRV9PT1BTLCBzdHIsIHJlZ3MsIDAs
IHJlZ3MtPmNhdXNlLCBTSUdTRUdWKTsKPiAgIAo+ICsJaWYgKHJlZ3MgJiYga2V4ZWNfc2hvdWxk
X2NyYXNoKGN1cnJlbnQpKQo+ICsJCWNyYXNoX2tleGVjKHJlZ3MpOwo+ICsKPiAgIAlidXN0X3Nw
aW5sb2NrcygwKTsKPiAgIAlhZGRfdGFpbnQoVEFJTlRfRElFLCBMT0NLREVQX05PV19VTlJFTElB
QkxFKTsKPiAgIAlzcGluX3VubG9ja19pcnEoJmRpZV9sb2NrKTsKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
