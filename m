Return-Path: <SRS0=mxd0=G2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 634E7C433DB
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Jan 2021 07:34:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFB15239D4
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Jan 2021 07:34:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFB15239D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=x2772hZ2p5tPcxYf31AytmceGZh+2Tat7kCzLW3+jGQ=; b=WHgAPisj74mwZ+SaxMHxdSHUw
	5MUNXkTZcwczXtqRr2q/z1uoqu5s7FrHClvci+O4q3C3NVHZsv/ZcAkJJrnSlvrGD9mQsuWau40bF
	ouFqFyJxIleEMTON6KW5P0FucSVryzLksxtD2nfDBqHNhF2vl8I/wM7Msd0mvLSrZ+KaCsDr97X4h
	67BpQyiko9+G31HCmBlHqlBrekIt6Vqp2PbdsRAfLdJECqN6NLS/thBRzYiJmn5c3mlYJZZX719Yg
	usrTBGUxrYmzQTTpzv/V+A5EsHcK1ra8mjE3GjbNUDxEuUqw0jSNbdR3Ow87RkOTSd9uUzZKOTvnS
	VJLaMT9dA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3DQf-0003Bw-Tw; Sat, 23 Jan 2021 07:33:53 +0000
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3DQc-0003AO-6R
 for linux-riscv@lists.infradead.org; Sat, 23 Jan 2021 07:33:51 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e01424; MF=guoren@linux.alibaba.com;
 NM=1; PH=DS; RN=12; SR=0; TI=SMTPD_---0UMaaSVg_1611387208; 
Received: from IT-C02Z45M7LVCF.local(mailfrom:guoren@linux.alibaba.com
 fp:SMTPD_---0UMaaSVg_1611387208) by smtp.aliyun-inc.com(127.0.0.1);
 Sat, 23 Jan 2021 15:33:28 +0800
Subject: Re: [PATCH] RISC-V: probes: Treat the instruction stream as
 host-endian
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
References: <20210123033429.2072716-1-palmer@dabbelt.com>
From: Guo Ren <guoren@linux.alibaba.com>
Message-ID: <beee96f4-2cf4-9be7-a891-3f6d5ee4baa9@linux.alibaba.com>
Date: Sat, 23 Jan 2021 15:33:28 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20210123033429.2072716-1-palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210123_023350_472619_CD4C84B1 
X-CRM114-Status: GOOD (  17.65  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: me@packi.ch, aou@eecs.berkeley.edu, kernel test robot <lkp@intel.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, linux-kernel@vger.kernel.org,
 penberg@kernel.org, mhiramat@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, kernel-team@android.com,
 mingo@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

QWNrZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgoKT24gMjAyMS8xLzIzIOS4iuWN
iDExOjM0LCBQYWxtZXIgRGFiYmVsdCB3cm90ZToKPiBGcm9tOiBQYWxtZXIgRGFiYmVsdCA8cGFs
bWVyZGFiYmVsdEBnb29nbGUuY29tPgo+Cj4gTmVpdGhlciBvZiB0aGVzZSBhcmUgYWN0dWFsbHkg
Y29ycmVjdDogdGhlIGluc3RydWN0aW9uIHN0cmVhbSBpcyBkZWZpbmVkCj4gKGZvciB2ZXJzaW9u
cyBvZiB0aGUgSVNBIG1hbnVhbCBuZXdlciB0aGFuIDIuMikgYXMgYSBzdHJlYW0gb2YgMTYtYml0
Cj4gbGl0dGxlLWVuZGlhbiBwYXJjZWxzLCB3aGljaCBpcyBkaWZmZXJlbnQgdGhhbiBqdXN0IGJl
aW5nIGxpdHRsZS1lbmRpYW4uCj4gSW4gdGhlb3J5IHdlIHNob3VsZCByZXByZXNlbnQgdGhpcyBh
cyBhIHR5cGUsIGJ1dCB3ZSBkb24ndCBoYXZlIGFueQo+IGNvbmNyZXRlIHBsYW5zIGZvciB0aGUg
YmlnIGVuZGlhbiBzdHVmZiBzbyBpdCBkb2Vzbid0IHNlZW0gd29ydGggdGhlCj4gdGltZSAtLSB3
ZSd2ZSBnb3QgdmFyaWFudHMgb2YgdGhpcyBhbGwgb3ZlciB0aGUgcGxhY2UuCj4KPiBJbnN0ZWFk
IEknbSBqdXN0IGRyb3BwaW5nIHRoZSB1bm5lY2Vzc2FyeSB0eXBlIGNvbnZlcnNpb24sIHdoaWNo
IGlzIGEKPiBOT1Agb24gTEUgc3lzdGVtcyBidXQgY2F1c2VzIGFuIHNwYXJzZSBlcnJvciBhcyB0
aGUgdHlwZXMgYXJlIGFsbCBtaXhlZAo+IHVwLgo+Cj4gUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0
IHJvYm90IDxsa3BAaW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFBhbG1lciBEYWJiZWx0IDxw
YWxtZXJkYWJiZWx0QGdvb2dsZS5jb20+Cj4gLS0tCj4gICBhcmNoL3Jpc2N2L2tlcm5lbC9wcm9i
ZXMvZGVjb2RlLWluc24uYyB8IDIgKy0KPiAgIGFyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9rcHJv
YmVzLmMgICAgIHwgMiArLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVzL2Rl
Y29kZS1pbnNuLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMvZGVjb2RlLWluc24uYwo+IGlu
ZGV4IDA4NzZjMzA0Y2E3Ny4uMGVkMDQzYWNjODgyIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yv
a2VybmVsL3Byb2Jlcy9kZWNvZGUtaW5zbi5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvcHJv
YmVzL2RlY29kZS1pbnNuLmMKPiBAQCAtMTYsNyArMTYsNyBAQAo+ICAgZW51bSBwcm9iZV9pbnNu
IF9fa3Byb2Jlcwo+ICAgcmlzY3ZfcHJvYmVfZGVjb2RlX2luc24ocHJvYmVfb3Bjb2RlX3QgKmFk
ZHIsIHN0cnVjdCBhcmNoX3Byb2JlX2luc24gKmFwaSkKPiAgIHsKPiAtCXByb2JlX29wY29kZV90
IGluc24gPSBsZTMyX3RvX2NwdSgqYWRkcik7Cj4gKwlwcm9iZV9vcGNvZGVfdCBpbnNuID0gKmFk
ZHI7Cj4gICAKPiAgIAkvKgo+ICAgCSAqIFJlamVjdCBpbnN0cnVjdGlvbnMgbGlzdDoKPiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVzL2twcm9iZXMuYyBiL2FyY2gvcmlzY3Yv
a2VybmVsL3Byb2Jlcy9rcHJvYmVzLmMKPiBpbmRleCBlNjA4OTNiZDg3ZGIuLmEyZWMxODY2MmZl
ZSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMva3Byb2Jlcy5jCj4gKysr
IGIvYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVzL2twcm9iZXMuYwo+IEBAIC01Nyw3ICs1Nyw3IEBA
IGludCBfX2twcm9iZXMgYXJjaF9wcmVwYXJlX2twcm9iZShzdHJ1Y3Qga3Byb2JlICpwKQo+ICAg
CX0KPiAgIAo+ICAgCS8qIGNvcHkgaW5zdHJ1Y3Rpb24gKi8KPiAtCXAtPm9wY29kZSA9IGxlMzJf
dG9fY3B1KCpwLT5hZGRyKTsKPiArCXAtPm9wY29kZSA9ICpwLT5hZGRyOwo+ICAgCj4gICAJLyog
ZGVjb2RlIGluc3RydWN0aW9uICovCj4gICAJc3dpdGNoIChyaXNjdl9wcm9iZV9kZWNvZGVfaW5z
bihwLT5hZGRyLCAmcC0+YWluc24uYXBpKSkgewoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
