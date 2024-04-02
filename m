Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B56C6FD1F
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2024 14:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Od1vL72eOe+yQiAxE/xIeELiiPJx3f7N+5YTCIuivg=; b=QeX3qhd7OPGdqu
	gf7w0srpxqKaXq0+KvhCb/zHI3hE0GWI945SF6ynoukp7Lj6iBTFRN7wpkI3BSUx9blPj4Z83k7yS
	g/S64UAii0nqwBIEoLy70Nk+vzTE2+7s3bjZlJbuNu/UzIysCUxMiViOxv6T1rdqN0gixnZo2+1yj
	LuTcrFjJdVfgtR4d+5VCYVXUyaIKYxnXd8pKt7K8s4j8pLGlxXL+Q/oBZy2oYNluebpSIDAPKNEV4
	3oHInV2Td4W6pUPP85TPUhbHr4li+Azc0Ztw2FPDJ8AlUx5/R6d1GDWJ7gZyk/6+TaxY2c+UuWMiq
	+oShx0Zd5oKkZd5n8MbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrexl-0000000BY3P-38nz;
	Tue, 02 Apr 2024 14:18:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrexj-0000000BY2Z-1qFP
	for linux-riscv@lists.infradead.org;
	Tue, 02 Apr 2024 14:18:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 57C0D60F94;
	Tue,  2 Apr 2024 14:18:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57FA2C433F1;
	Tue,  2 Apr 2024 14:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712067485;
	bh=JXeMgDJf7NztdBYQwze7zpUZgNxk5FTdMBjGNHLcJyc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=dfVAw2iRAvypeK/Zlw38Hf7kCcsuNwEhmQfBge96A/7PycL6UubyOuVvmKNRhslrZ
	 oNMfs3i2an13hurYmIouOhXwU0P7YwaKep4CpvN9DQOtyYOXS6BZSwcsdI9SEJ6VzA
	 J5WhBcosWO0m1/FPgwgQ4g5iwFvLaNkajPW7lBdqd+N+nu7hvFWMhPYBJZUM3RJ4KD
	 9LXtsG9PhmP3zt1699OP/kxI+DGr59xUutBN6wJ6BNEDepT71pRFxMer7JyIZ/6vZh
	 x0xWH8Nlw7f36+WcOiVt+7thgJjsCnDL3yrWnwaFMwUp/OxG3rfLNZe8aYzDY/t9pi
	 LsntEkP/9ghMg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>, Conor Dooley <conor@kernel.org>
Cc: Stefan O'Rear <sorear@fastmail.com>, Pu Lehui <pulehui@huaweicloud.com>,
 bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 netdev@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>, Yonghong Song
 <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh
 <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Mykola Lysenko
 <mykolal@fb.com>, Manu Bretelle <chantr4@gmail.com>, Pu Lehui
 <pulehui@huawei.com>
Subject: Re: [PATCH bpf-next 2/5] riscv, bpf: Relax restrictions on Zbb
 instructions
In-Reply-To: <20240329-linguini-uncured-380cb4cff61c@wendy>
References: <20240328124916.293173-1-pulehui@huaweicloud.com>
 <20240328124916.293173-3-pulehui@huaweicloud.com>
 <3ed9fe94-2610-41eb-8a00-a9f37fcf2b1a@app.fastmail.com>
 <20240328-ferocity-repose-c554f75a676c@spud>
 <20240329-linguini-uncured-380cb4cff61c@wendy>
Date: Tue, 02 Apr 2024 16:18:02 +0200
Message-ID: <87il0zrgpx.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_071807_783338_3D4EEDB1 
X-CRM114-Status: GOOD (  30.36  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Q29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4gd3JpdGVzOgoKPiBPbiBU
aHUsIE1hciAyOCwgMjAyNCBhdCAxMDowNzoyM1BNICswMDAwLCBDb25vciBEb29sZXkgd3JvdGU6
Cj4KPj4gQXMgSSBzYWlkIG9uIElSQyB0byB5b3UgZWFybGllciwgSSB0aGluayB0aGUgS2NvbmZp
ZyBvcHRpb25zIGhlcmUgYXJlIGluCj4+IG5lZWQgb2YgYSBiaXQgb2YgYSBzcHJpbmcgY2xlYW5p
bmcgLSB0aGV5IHNob3VsZCBiZSBtb2RpZmllZCB0byBleHBsYWluCj4+IHRoZWlyIGluZGl2aWR1
YWwgcHVycG9zZXMsIGJlIHRoYXQgZW5hYmxpbmcgb3B0aW1pc2F0aW9ucyBpbiB0aGUga2VybmVs
Cj4+IG9yIGJlaW5nIHJlcXVpcmVkIGZvciB1c2Vyc3BhY2UuIEknbGwgdHJ5IHRvIHNlbmQgYSBw
YXRjaCBmb3IgdGhhdCBpZgo+PiBJIHJlbWVtYmVyIHRvbW9ycm93Lgo+Cj4gU29tZXRoaW5nIGxp
a2UgdGhpczoKPgo+IC0tID44IC0tCj4gY29tbWl0IDUxMjU1MDRiZWFlZGQ2NjliMDgyYmY3NGIw
MjAwM2E3NzM2MDY3MGYKPiBBdXRob3I6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3Jv
Y2hpcC5jb20+Cj4gRGF0ZTogICBGcmkgTWFyIDI5IDExOjEzOjIyIDIwMjQgKzAwMDAKPgo+ICAg
ICBSSVNDLVY6IGNsYXJpZnkgd2hhdCBzb21lIFJJU0NWX0lTQSogY29uZmlnIG9wdGlvbnMgZG8K
PiAgICAgCj4gICAgIER1cmluZyBzb21lIGRpc2N1c3Npb24gb24gSVJDIHllc3RlcmRheSBhbmQg
b24gUHUncyBicGYgcGF0Y2ggWzFdCj4gICAgIEkgbm90aWNlZCB0aGF0IHRoZXNlIFJJU0NWX0lT
QSogS2NvbmZpZyBvcHRpb25zIGFyZSBub3QgcmVhbGx5IGNsZWFyCj4gICAgIGFib3V0IHRoZWly
IGltcGxpY2F0aW9ucy4gTWFueSBvZiB0aGVzZSBvcHRpb25zIGhhdmUgbm8gaW1wYWN0IG9uIHdo
YXQKPiAgICAgdXNlcnNwYWNlIGlzIGFsbG93ZWQgdG8gZG8sIGZvciBleGFtcGxlIGFuIGFwcGxp
Y2F0aW9uIGNhbiB1c2UgWmJiCj4gICAgIHJlZ2FyZGxlc3Mgb2Ygd2hldGhlciBvciBub3QgdGhl
IGtlcm5lbCBkb2VzLiBDaGFuZ2UgdGhlIGhlbHAgdGV4dCB0bwo+ICAgICB0cnkgYW5kIGNsYXJp
Znkgd2hldGhlciBvciBub3QgYW4gb3B0aW9uIGFmZmVjdHMganVzdCB0aGUga2VybmVsLCBvcgo+
ICAgICBhbHNvIHVzZXJzcGFjZS4gTm9uZSBvZiB0aGVzZSBvcHRpb25zIGFjdHVhbGx5IGNvbnRy
b2wgd2hldGhlciBvciBub3QgYW4KPiAgICAgZXh0ZW5zaW9uIGlzIGRldGVjdGVkIGR5bmFtaWNh
bGx5IGFzIHRoYXQncyBkb25lIHJlZ2FyZGxlc3Mgb2YgS2NvbmZpZwo+ICAgICBvcHRpb25zLCBz
byBkcm9wIGFueSB0ZXh0IHRoYXQgaW1wbGllcyB0aGUgb3B0aW9uIGlzIHJlcXVpcmVkIGZvcgo+
ICAgICBkeW5hbWljIGRldGVjdGlvbiwgcmV3b3JkaW5nIHRoZW0gYXMgImRvIHggd2hlbiB5IGlz
IGRldGVjdGVkIi4KPiAgICAgCj4gICAgIExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xp
bnV4LXJpc2N2LzIwMjQwMzI4LWZlcm9jaXR5LXJlcG9zZS1jNTU0Zjc1YTY3NmNAc3B1ZC8gWzFd
Cj4gICAgIFNpZ25lZC1vZmYtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hp
cC5jb20+Cj4gICAgIC0tLQo+ICAgICBJIGRpZCB0aGlzIGJhc2VkIG9uIHRvcCBvZiBTYW11ZWwn
cyBjaGFuZ2VzIGRyb3BwaW5nIHRoZSBNTVUKPiAgICAgcmVxdXVyZW1lbnRzIGp1c3QgaW4gY2Fz
ZSwgYnV0IEkgZG9uJ3QgdGhpbmsgdGhlcmUncyBhIGNvbmZsaWN0Ogo+ICAgICBodHRwczovL2xv
cmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI0MDIyNzAwMzYzMC4zNjM0NTMzLTQtc2FtdWVs
LmhvbGxhbmRAc2lmaXZlLmNvbS8KPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcg
Yi9hcmNoL3Jpc2N2L0tjb25maWcKPiBpbmRleCBkOGE3NzdmNTk0MDIuLmYzMjdhOGFjNjQ4ZiAx
MDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L0tjb25maWcKPiArKysgYi9hcmNoL3Jpc2N2L0tjb25m
aWcKPiBAQCAtNTAxLDggKzUwMSw4IEBAIGNvbmZpZyBSSVNDVl9JU0FfU1ZOQVBPVAo+ICAJZGVw
ZW5kcyBvbiBSSVNDVl9BTFRFUk5BVElWRQo+ICAJZGVmYXVsdCB5Cj4gIAloZWxwCj4gLQkgIEFs
bG93IGtlcm5lbCB0byBkZXRlY3QgdGhlIFN2bmFwb3QgSVNBLWV4dGVuc2lvbiBkeW5hbWljYWxs
eSBhdCBib290Cj4gLQkgIHRpbWUgYW5kIGVuYWJsZSBpdHMgdXNhZ2UuCj4gKwkgIEFkZCBzdXBw
b3J0IGZvciB0aGUgU3ZuYXBvdCBJU0EtZXh0ZW5zaW9uIHdoZW4gaXQgaXMgZGV0ZWN0ZWQgYnkK
PiArCSAgdGhlIGtlcm5lbCBhdCBib290Lgo+ICAKPiAgCSAgVGhlIFN2bmFwb3QgZXh0ZW5zaW9u
IGlzIHVzZWQgdG8gbWFyayBjb250aWd1b3VzIFBURXMgYXMgYSByYW5nZQo+ICAJICBvZiBjb250
aWd1b3VzIHZpcnR1YWwtdG8tcGh5c2ljYWwgdHJhbnNsYXRpb25zIGZvciBhIG5hdHVyYWxseQo+
IEBAIC01MjAsOSArNTIwLDkgQEAgY29uZmlnIFJJU0NWX0lTQV9TVlBCTVQKPiAgCWRlcGVuZHMg
b24gUklTQ1ZfQUxURVJOQVRJVkUKPiAgCWRlZmF1bHQgeQo+ICAJaGVscAo+IC0JICAgQWRkcyBz
dXBwb3J0IHRvIGR5bmFtaWNhbGx5IGRldGVjdCB0aGUgcHJlc2VuY2Ugb2YgdGhlIFN2cGJtdAo+
IC0JICAgSVNBLWV4dGVuc2lvbiAoU3VwZXJ2aXNvci1tb2RlOiBwYWdlLWJhc2VkIG1lbW9yeSB0
eXBlcykgYW5kCj4gLQkgICBlbmFibGUgaXRzIHVzYWdlLgo+ICsJICAgQWRkIHN1cHBvcnQgZm9y
IHRoZSBTdnBibXQgSVNBLWV4dGVuc2lvbiAoU3VwZXJ2aXNvci1tb2RlOgo+ICsJICAgcGFnZS1i
YXNlZCBtZW1vcnkgdHlwZXMpIHdoZW4gaXQgaXMgZGV0ZWN0ZWQgYnkgdGhlIGtlcm5lbCBhdAo+
ICsJICAgYm9vdC4KPiAgCj4gIAkgICBUaGUgbWVtb3J5IHR5cGUgZm9yIGEgcGFnZSBjb250YWlu
cyBhIGNvbWJpbmF0aW9uIG9mIGF0dHJpYnV0ZXMKPiAgCSAgIHRoYXQgaW5kaWNhdGUgdGhlIGNh
Y2hlYWJpbGl0eSwgaWRlbXBvdGVuY3ksIGFuZCBvcmRlcmluZwo+IEBAIC01NDEsMTQgKzU0MSwx
NSBAQCBjb25maWcgVE9PTENIQUlOX0hBU19WCj4gIAlkZXBlbmRzIG9uIEFTX0hBU19PUFRJT05f
QVJDSAo+ICAKPiAgY29uZmlnIFJJU0NWX0lTQV9WCj4gLQlib29sICJWRUNUT1IgZXh0ZW5zaW9u
IHN1cHBvcnQiCj4gKwlib29sICJWZWN0b3IgZXh0ZW5zaW9uIHN1cHBvcnQiCj4gIAlkZXBlbmRz
IG9uIFRPT0xDSEFJTl9IQVNfVgo+ICAJZGVwZW5kcyBvbiBGUFUKPiAgCXNlbGVjdCBEWU5BTUlD
X1NJR0ZSQU1FCj4gIAlkZWZhdWx0IHkKPiAgCWhlbHAKPiAgCSAgU2F5IE4gaGVyZSBpZiB5b3Ug
d2FudCB0byBkaXNhYmxlIGFsbCB2ZWN0b3IgcmVsYXRlZCBwcm9jZWR1cmUKPiAtCSAgaW4gdGhl
IGtlcm5lbC4KPiArCSAgaW4gdGhlIGtlcm5lbC4gV2l0aG91dCB0aGlzIG9wdGlvbiBlbmFibGVk
LCBuZWl0aGVyIHRoZSBrZXJuZWwgbm9yCj4gKwkgIHVzZXJzcGFjZSBtYXkgdXNlIHZlY3Rvci4K
PiAgCj4gIAkgIElmIHlvdSBkb24ndCBrbm93IHdoYXQgdG8gZG8gaGVyZSwgc2F5IFkuCj4gIAo+
IEBAIC02MDYsOCArNjA3LDggQEAgY29uZmlnIFJJU0NWX0lTQV9aQkIKPiAgCWRlcGVuZHMgb24g
UklTQ1ZfQUxURVJOQVRJVkUKPiAgCWRlZmF1bHQgeQo+ICAJaGVscAo+IC0JICAgQWRkcyBzdXBw
b3J0IHRvIGR5bmFtaWNhbGx5IGRldGVjdCB0aGUgcHJlc2VuY2Ugb2YgdGhlIFpCQgo+IC0JICAg
ZXh0ZW5zaW9uIChiYXNpYyBiaXQgbWFuaXB1bGF0aW9uKSBhbmQgZW5hYmxlIGl0cyB1c2FnZS4K
PiArCSAgIEFkZCBzdXBwb3J0IGZvciBlbmFibGluZyBvcHRpbWlzYXRpb25zIGluIHRoZSBrZXJu
ZWwgd2hlbiB0aGUKCkkgZG9uJ3QgY2FyZSBtdWNoLCBidXQgIm9wdGltaXphdGlvbnMiIGhlcmUg
LS0gZm9yIGNvbnNpc3RlbmN5IHJlYXNvbnMhClsxXSA7LSkKCk5pY2UgY2hhbmdlIQoKUmV2aWV3
ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KClsxXSBodHRwczovL2x3
bi5uZXQvQXJ0aWNsZXMvNjM2Mjg2LwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
