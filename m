Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F919C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 09:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XlAXRLyswVr5p/ehpNDnbyE6+gHCg+JZwT4i1M3DrCM=; b=QNVdvIymI+szm9
	zDn3dl0/aOJBXW6hTOMQCiiEFOcbaTDAxG1hFs77GS0CN1l3LGR1AzcQfUIti/K/t1jrKvTToXJVi
	jrOP2Dqx3K5c3ec2RzM8HMPwQzx+CKHuDqxycwZaBH2P5O35bozeACsmW4wliGK9R23sOWR7ZehWS
	8XTyR4hhaMMFrfiMRxoYmvwT5AB6qOW3S0lEi8qEGPDk7Ib33+2pcABAEf0YSpJrtIbcKJMXo+p/p
	YPu5HYPApTnddtBvS30FXV1QNCqpIi89zIwk3BFeTz2m3n+eCLc8LWhVDAreu/nwiLw/MySMEuFZ2
	BiKbuyZsIgm+h5v3+zqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCzpt-007wbw-3U; Wed, 04 Jan 2023 09:13:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCzow-007wAU-L8
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 09:12:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2B9DE615D2;
	Wed,  4 Jan 2023 09:12:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41330C433D2;
	Wed,  4 Jan 2023 09:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672823545;
	bh=Hr95qdIHJ3vIdDscritgygh7Q2O7d4i8wglmOqf/p48=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=u3+CsheNf9bobT93mNgsGA68gR+9bS/z0GyylZIoWcbeiwOQ2OnLHh0Kiqmb95dIl
	 bzF1L0nlgALs1KD1uxDcn7s73yNMp/Wbu2st8NdkwUoH87ZtVrfH7ku+e+oXOcNiq+
	 HmT5wHRWfJ3dKgCSirXyVW4K/huMlbt90n/CV7t4sa+V5SDLOLS1UerflfR2XkWrNW
	 XkuTQdntlgyqoKso1QIJnF0zhsuxCLgNMqDtKQALzpJDikb9W2ohSkkUogq5tCZcM9
	 T55cKec4lKKrQXMoVtdKJpJ2JR0tRYCyXPsHWzOc5bUAmLKedYU6X3YO1l9GN3eNiK
	 rTQGD2DeNNMxQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: "liaochang (A)" <liaochang1@huawei.com>, Chen Guokai
 <chenguokai17@mails.ucas.ac.cn>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, rostedt@goodmis.org,
 mingo@redhat.com, sfr@canb.auug.org.au
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 7/9] riscv/kprobe: Prepare detour buffer for
 optimized kprobe
In-Reply-To: <088ed826-59a8-37a3-401e-2ed022a4a097@huawei.com>
References: <20221224114315.850130-1-chenguokai17@mails.ucas.ac.cn>
 <20221224114315.850130-8-chenguokai17@mails.ucas.ac.cn>
 <87r0wcvmn1.fsf@all.your.base.are.belong.to.us>
 <088ed826-59a8-37a3-401e-2ed022a4a097@huawei.com>
Date: Wed, 04 Jan 2023 10:12:23 +0100
Message-ID: <87sfgqr7d4.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_011226_811931_B64C9D74 
X-CRM114-Status: GOOD (  10.73  )
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

ImxpYW9jaGFuZyAoQSkiIDxsaWFvY2hhbmcxQGh1YXdlaS5jb20+IHdyaXRlczoKCj4+PiArU1lN
X0VOVFJZKG9wdHByb2JlX3RlbXBsYXRlX2luc24sIFNZTV9MX0dMT0JBTCwgU1lNX0FfTk9ORSkK
Pj4+ICsJLyoKPj4+ICsJICogU3RlcDM6Cj4+PiArCSAqIE5PUFMgd2lsbCBiZSByZXBsYWNlZCBi
eSB0aGUgcHJvYmVkIGluc3RydWN0aW9uLCBhdCB3b3JzdCBjYXNlIDMgUlZDCj4+PiArCSAqIGFu
ZCAxIFJWSSBpbnN0cnVjdGlvbnMgaXMgYWJvdXQgdG8gZXhlY3V0ZSBvdXQgb2YgbGluZS4KPj4+
ICsJICovCj4+PiArCW5vcAo+PiAKPj4gQSBub3AgaGVyZSB3aWxsIGJlIGVpdGhlciBhIGNvbXBy
ZXNzZWQgbm9wIG9yIGEgbm9uLWNvbXByZXNzZWQsCj4+IGRlcGVuZGluZyBvbiB0aGUgYnVpbGQg
KEMtZW5hYmxlZCBvciBub3QpLCByaWdodD8gTWF5YmUgYmUgZXhwbGljaXQgdG8KPj4gdGhlIGFz
c2VtYmxlciB3aGF0IHlvdSB3YW50Pwo+PiAKPgo+IFlvdSBhcmUgcmlnaHQsIGlmIENPTkZJR19S
SVNDVl9JU0FfQyBpcyBkaXNhYmxlZCwgdHdvIE5PUCBpcyBlbm91Z2ggZm9yIDIgUlZJIGV4ZWN1
dGUgb3V0IG9mIGxpbmUsCj4gaWYgQ09ORklHX1JJU0NWX0lTQV9DIGlzIGVuYWJsZWQsIGl0IG5l
ZWRzIGVpZ2h0IEMuTk9QIGhlcmUgZm9yIHRoZSB3b3JzdCBjYXNlICgzIFJWQyArIDEgUlZJKS4K
Pgo+IEkgd2lsbCB1c2Uge0N9Lk5PUCBleHBsaWNpdGx5IGZvciBkaWZmZXJlbnQgY29uZmlndXJl
IGluIG5leHQgcmV2aXNpb24sIHRoYW5rcy4KCldoYXQgSSBtZWFudCB3YXMgdGhhdCAibm9wIiBj
YW4gZXhwYW5kIHRvIGNvbXByZXNzZWQgaW5zdHJ1Y3Rpb25zLCBhbmQKeW91IHNob3VsZCBiZSBl
eHBsaWNpdC4gU28geW91IGtub3cgaG93IGl0J3MgZXhwYW5kZWQgYnkgdGhlCmNvbXBpbGVyL2Fz
c2VtYmxlci4KCkFuIGV4YW1wbGU6CgokIGNhdCBiYXIuUwoJLnRleHQKYmFyOgoJbm9wCglub3AK
JCByaXNjdjY0LWxpbnV4LWdudS1nY2MgLU8yIC1vIGJhci5vIC1jIGJhci5TICYmIHJpc2N2NjQt
bGludXgtZ251LW9iamR1bXAgLU0gbm8tYWxpYXNlcyAtZCBiYXIubwoKYmFyLm86ICAgICBmaWxl
IGZvcm1hdCBlbGY2NC1saXR0bGVyaXNjdgoKCkRpc2Fzc2VtYmx5IG9mIHNlY3Rpb24gLnRleHQ6
CgowMDAwMDAwMDAwMDAwMDAwIDxiYXI+OgogICAwOgkwMDAxICAgICAgICAgICAgICAgIAljLmFk
ZGkJemVybywwCiAgIDI6CTAwMDEgICAgICAgICAgICAgICAgCWMuYWRkaQl6ZXJvLDAKCgp2cwoK
JCBjYXQgZm9vLlMKCS50ZXh0CmZvbzoKCS5vcHRpb24gbm9ydmMKCW5vcAoJbm9wCgokIHJpc2N2
NjQtbGludXgtZ251LWdjYyAtTzIgLW8gZm9vLm8gLWMgZm9vLlMgJiYgcmlzY3Y2NC1saW51eC1n
bnUtb2JqZHVtcCAtTSBuby1hbGlhc2VzIC1kIGZvby5vCgpmb28ubzogICAgIGZpbGUgZm9ybWF0
IGVsZjY0LWxpdHRsZXJpc2N2CgoKRGlzYXNzZW1ibHkgb2Ygc2VjdGlvbiAudGV4dDoKCjAwMDAw
MDAwMDAwMDAwMDAgPGZvbz46CiAgIDA6CTAwMDAwMDEzICAgICAgICAgIAlhZGRpCXplcm8semVy
bywwCiAgIDQ6CTAwMDAwMDEzICAgICAgICAgIAlhZGRpCXplcm8semVybywwCgoKQmrDtnJuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
