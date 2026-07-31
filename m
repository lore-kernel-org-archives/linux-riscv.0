Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA22C5516F
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Jul 2026 16:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o29l/Y/fkm53TMG7OxPWhCM8PG4f3rh0E5uUAMwNQds=; b=Yb4b2i0EfOJhnr
	yL6SpHp3FbNGeHL6Cb9Z7kYsOh6Woav2cXehvDTcR5i4oMaK/TMnlUDyeVtgKZ2YEwKGsxRRirh8d
	wT98tHKoGVQ7QX3SXmUQQjD/whyDm/m2hU0+2DVvtMQBJshilpgW5CXD2tgjNQWmy4vVHKm/eDrnY
	wNcX2DGasNN085If29FDMI4FcHlG58/sL5uRYrg/hr3R9tAeIOfc+9t+yyBDZ0BxIzXLl0HgmHy7G
	NaDMXtyNkt6DfAXsOE2YwphBXutxKOOCNn9ossjUzVc+d3FxWrIZvEQI21+YdlydUyn6irDDavlIz
	DHJJJ68Cxds47GzKrZtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpq6i-0000000D7pO-3Jqc;
	Fri, 31 Jul 2026 16:29:12 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpq6g-0000000D7nm-3tH4
	for linux-riscv@lists.infradead.org;
	Fri, 31 Jul 2026 16:29:12 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-c15e03c2763so212887566b.0
        for <linux-riscv@lists.infradead.org>; Fri, 31 Jul 2026 09:29:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785515349; cv=none;
        d=google.com; s=arc-20260327;
        b=DWC0q/SySadt8XlnHfQOSeC0n+cXqsEgfMBv9iFN2jr16I4KZXdu+2MFe5I0jNvXeo
         OBXpzuzjOPK53joVlUU70hKlx6FwVnhQ3DruPZHXOkLFU5OXy2JtM1W8kJKUHvhlruLD
         Ph3vdkoxHIWDTEJ6itPne5eAU6G6rB5rVIveIPq5jAwL+OQw3cGUu2co76DgeW0Ztj7l
         61hXa14pIYu0IXNN18xNskwer+uOV3Pp0NxnjJcrRHBvWvmv5FicOyslFxOZfsQcfca+
         v8VlW5jEi49anwmz8GaAh8V6lCXIE+2qTXHCm14AL2nj273ZiIankT7OeauV8qsTA4BT
         uxoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Bzxv7es/cGE32AnA7OkYihLVGuHTXsiSU2uTN1sSLTM=;
        fh=o9sIYWr33vJm1q/u6PqiY8xkFOLWryiPv57lnzHa2GE=;
        b=hdlhBhfSgtPgHuuJFKKGgpmVf27QdHFC2SbBxArBD0lFEDMSOP+hiHsS1V/TRVSyM8
         y8iM3X0/8m0WdNxBcP86cucKx8Uw5QzcOpRz+zd4tSZ/B0ro/p608v3f5NlKCvjgWAED
         B9YYDLMb2u5WoNlZtzIKnDBiCfCdHkIzAlzTJZnHIl9/2Mz+xjtiYzrOfBi12+azWjSM
         gIKk20qkPw+08ztcv9LDA9c/SQ6Us0mvj33GQ666qnPYG2yFuvF0B91AVfBolRfEtCDl
         3RXNXTnqnDwgYmmt3Dp3bewmpD2b8tPc0NN+HXpnroPdl0RGol/Znjkae/AMU111yDHl
         eXDg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785515349; x=1786120149; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bzxv7es/cGE32AnA7OkYihLVGuHTXsiSU2uTN1sSLTM=;
        b=OnGSmvEh8IOxTvKknGgGfsEUVfmGWzp0YACe6mToPyGnlWh9NlDtqsPQaJ0W0K1ZVP
         GXGG8TzQlHeSutDU75XXGE7ZZYbojaycAJVlx8YB2CkEOjEzPI8u3hs+t9KDNsd6lXRq
         rR7E95GSHTPrj++Tc6+9tQKFKVdzKqsc1sPLXSpWi1aqSlvz1B2RVCHa0g6kTY12Ws7A
         sai9p00LGNeoR+bZIggsLnGVE71ccly8YPbMlEfHj3x7N16BlJmSV47xmNuNjk8xjFSX
         Zu02m2E/JAaLAwSAJnEzR47UdpStcHp/831VFzOfDM4qx7DZm/+9JpdULqg33QwaIzMy
         axXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785515349; x=1786120149;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bzxv7es/cGE32AnA7OkYihLVGuHTXsiSU2uTN1sSLTM=;
        b=b4L7BeJzzOEgDEPO8H6VLxQjMwU87df6Mr4sQWD7xGsieDsMhL2gmILW4TiF6fHKH7
         OKkufG5t9WVsR+izLqtXzyx3YXu8C1wXkSMHtLfGqJKC3RwHFhl5f+9wkX4wsgrjbFrb
         zkBMcV9633NOzViTvxGhg5fPv/I8N9bRKBoOTMl1VKECCdJsHy6qHZrkpMKyZpwjOf5w
         654hVP/zg0evNt3/oyLVzzEGL3aEh3MgBmVCZdRsLkGPJoi1RUFuQLLWzZ604cQ5nYrA
         EV/neEbLtNlkvAc3G2TO69uH9VBXAPpHNIhHs9R0UDkc4l+4b5+Qja9Wtmub0ryq5jq+
         1Okg==
X-Forwarded-Encrypted: i=1; AHgh+Rodp2ukZE6F8h2WibrbpHjSyv/bEUuvWVGVvJup6Os++2Q8dZWsZmz/lA+xoMtMT+rdVrLBKfnXFNwfcQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YztrFQYD+oxTXCJiBRFjXhhtt8BFGxLeOl1IpF76tbsICFUDdan
	YBM0Y9kMZHMv5jEQD+zUdlsH0nJY1eT36LwSMDNfNyioZYgYJgyaFU/wqKvrMznnXVVrM2OKBh4
	41GwG7ChUBXgBk4ilKr+0dbFPnfBNVw==
X-Gm-Gg: AR+sD102r1IuNTWcP5HJgcMoVB55dUU8y+7V0ekyY1HCrnCdxc1rtXMk6vNizPduGJz
	6FpWCYzq6Q1gFPw/aolecuXrtmu0yy03kz5UAuE344MXPhfuG/Os7eRR0NU7ltiG+OohsDd1QRO
	3TYkKBULcnX8YGG4ajKJj7OE15aGZ/wOwCioxc/bgCmCNF9teLIOqG3JMgBWtKhP00DCfwEfWWa
	3/YKMmp4nJ2w1fwUHjFaS7mfbRyRgo15YAmMGiMNPOJ+Udt+vulc1C1H2l1AqEUHjohKTkNRusL
	ms31vmftpskbzWv7yoC4RyENG/Mh1t7y/ylCruP/fp71Qnww8zU4vomL1UlaNgGkIK8h0cLfQvT
	819REv5aNE8YHtzQiiuA0WnCoK9+YLtAZ0QsN2knxS6ED3CXbikmfYBc=
X-Received: by 2002:a17:907:3e95:b0:c1f:ba1d:805c with SMTP id
 a640c23a62f3a-c1fe7bdb22cmr26721166b.19.1785515348552; Fri, 31 Jul 2026
 09:29:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAGEsz8GNHFCOZ=-_y56rK1aX+Ze7w8qVqZSQ-OuGo_dPC4bXCw@mail.gmail.com>
 <2026072959-penpal-petroleum-bf6e@gregkh>
In-Reply-To: <2026072959-penpal-petroleum-bf6e@gregkh>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Sat, 1 Aug 2026 01:28:56 +0900
X-Gm-Features: AUfX_mwKhraFu6PfYqhOTJLGLuJFa6rmB6-o56Tiq_IBsdm3mhBeyxgy96LLjrQ
Message-ID: <CAGEsz8EzBqC=0A_DgRCMQCfmAp8iKysAyzccJ1sDrQE9OaZY2g@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Synchronize hrtimer callback during teardown
To: Greg KH <gregkh@linuxfoundation.org>
Cc: anup@brainfault.org, atish.patra@linux.dev, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	security@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_092910_993261_921DF10A 
X-CRM114-Status: GOOD (  22.75  )
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

WW91J3JlIHJpZ2h0LiBJJ2xsIGFkZCBhbiBBc3Npc3RlZC1ieSB0cmFpbGVyIGFuZCBkcm9wCnNl
Y3VyaXR5QGtlcm5lbC5vcmcgZnJvbSB0aGUgcmVjaXBpZW50cyBpbiB2Mi4KClRoYW5rcywKTXll
b25naHVuCgoyMDI264WEIDfsm5QgMjnsnbwgKOyImCkg7Jik7ZuEIDU6NDUsIEdyZWcgS0ggPGdy
ZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPuuLmOydtCDsnpHshLE6Cj4KPiBPbiBXZWQsIEp1bCAy
OSwgMjAyNiBhdCAwMTo0MjoyNEFNICswOTAwLCBNeWVvbmdodW4gUGFrIHdyb3RlOgo+ID4gVGhl
IG5vbi1Tc3RjIGhydGltZXIgY2FsbGJhY2sgY2xlYXJzIG5leHRfc2V0IGJlZm9yZSBpdHMgZmlu
YWwgdXNlcyBvZgo+ID4gdGhlIGVuY2xvc2luZyB2Q1BVLiAgSWYgdGVhcmRvd24gb2JzZXJ2ZXMg
bmV4dF9zZXQgYXMgZmFsc2Ugd2hpbGUgdGhlCj4gPiBjYWxsYmFjayBpcyBzdGlsbCBydW5uaW5n
LCBrdm1fcmlzY3ZfdmNwdV90aW1lcl9jYW5jZWwoKSBza2lwcwo+ID4gaHJ0aW1lcl9jYW5jZWwo
KSBhbmQga3ZtX2Rlc3Ryb3lfdmNwdXMoKSBjYW4gZnJlZSB0aGUgdkNQVSBiZWZvcmUgdGhlCj4g
PiBjYWxsYmFjayBlbnRlcnMga3ZtX3Jpc2N2X3ZjcHVfc2V0X2ludGVycnVwdCgpLgo+ID4KPiA+
IEEgZ3Vlc3QgY2FuIGFybSB0aGUgdGltZXIgd2l0aCBTQkkgVElNRSBhbmQgcmVxdWVzdCBzaHV0
ZG93biB3aXRoIFNCSQo+ID4gbGVnYWN5IHNodXRkb3duIG9yIFNSU1QuICBBIFZNTSB0aGF0IGhv
bm9ycyBLVk1fRVhJVF9TWVNURU1fRVZFTlQgYW5kCj4gPiBkZXN0cm95cyB0aGUgVk0gc3VwcGxp
ZXMgdGhlIHRlYXJkb3duIHNpZGUgb2YgdGhlIHJhY2U7IG5vIHBvc3QtbGF1bmNoCj4gPiBob3N0
IGlvY3RsIGlzIG5lZWRlZCB0byBhcm0gb3IgcmVxdWVzdCB0ZWFyZG93bi4KPiA+Cj4gPiBPbiB1
cHN0cmVhbSBtYXN0ZXIgNjJjYzkwMjQxNTQ4LCBnZW5lcmljIEtBU0FOIHJlcG9ydGVkOgo+ID4K
PiA+ICAgQlVHOiBLQVNBTjogc2xhYi11c2UtYWZ0ZXItZnJlZSBpbiBkb19yYXdfc3Bpbl9sb2Nr
Cj4gPiAgIFdyaXRlIG9mIHNpemUgNCBhdCBhZGRyIGZmNjAwMDAwMDVlNTg4OTgKPiA+Cj4gPiAg
IGt2bV9yaXNjdl92Y3B1X3NldF9pbnRlcnJ1cHQKPiA+ICAga3ZtX3Jpc2N2X3ZjcHVfaHJ0aW1l
cl9leHBpcmVkCj4gPiAgIF9faHJ0aW1lcl9ydW5fcXVldWVzCj4gPiAgIGhydGltZXJfaW50ZXJy
dXB0Cj4gPgo+ID4gVGhlIG9iamVjdCB3YXMgYWxsb2NhdGVkIGJ5IEtWTV9DUkVBVEVfVkNQVSBh
bmQgZnJlZWQgY29uY3VycmVudGx5IGJ5Ogo+ID4KPiA+ICAga3ZtX2Rlc3Ryb3lfdmNwdXMKPiA+
ICAga3ZtX2FyY2hfZGVzdHJveV92bQo+ID4gICBrdm1fZGVzdHJveV92bQo+ID4gICBfX2ZwdXQK
PiA+Cj4gPiBGb3IgZGV0ZXJtaW5pc3RpYyB2YWxpZGF0aW9uLCBJIGFkZGVkIG1kZWxheSgxMDAw
KSBpbW1lZGlhdGVseSBhZnRlcgo+ID4gdGhlIGV4aXN0aW5nIG5leHRfc2V0ID0gZmFsc2UgYXNz
aWdubWVudC4gIFRoaXMgb25seSB3aWRlbnMgdGhlCj4gPiBleGlzdGluZyBwb3N0LWNsZWFyIGNh
bGxiYWNrIHdpbmRvdy4gIEEgbm8tZGVsYXkgdHJhY2UgYnVpbGQgbmF0dXJhbGx5Cj4gPiByZWFj
aGVkIHRoZSBjYWxsYmFjay1hZnRlci10ZWFyZG93bi1zdGFydC9iZWZvcmUtZGVpbml0IG9yZGVy
aW5nIGluIDEyCj4gPiBvZiAyMDAgcnVucywgYnV0IDEsNTAwIHN0b2NrLWtlcm5lbCBzdHJlc3Mg
aXRlcmF0aW9ucyBkaWQgbm90IHByb2R1Y2UgYQo+ID4gS0FTQU4gcmVwb3J0LCBzbyBuYXR1cmFs
IHJlcHJvZHVjdGlvbiBpcyB0aW1pbmctc2Vuc2l0aXZlLgo+ID4KPiA+IEFsd2F5cyBpbnZva2Ug
aHJ0aW1lcl9jYW5jZWwoKSBmb3IgYW4gaW5pdGlhbGl6ZWQgdGltZXIuICBQcmVzZXJ2ZSB0aGUK
PiA+IGV4aXN0aW5nIC1FSU5WQUwgcmVzdWx0IHdoZW4gdGhlIHRpbWVyIGlzIG5vIGxvbmdlciBz
ZXQsIGJ1dCBvbmx5IGFmdGVyCj4gPiBzeW5jaHJvbml6aW5nIHdpdGggYSBydW5uaW5nIGNhbGxi
YWNrLgo+ID4KPiA+IFdpdGggdGhpcyBwYXRjaCwgaHJ0aW1lcl9jYW5jZWwoKSBibG9ja2VkIGZv
ciB0aGUgZnVsbCB3aWRlbmVkIGNhbGxiYWNrCj4gPiB3aW5kb3cgYmVmb3JlIHZDUFUgZGVzdHJ1
Y3Rpb24uICBLQVNBTiByZXBvcnRlZCBubyBlcnJvciBpbiAxMDAKPiA+IGZpeGVkLWFuZC13aWRl
bmVkIHJ1bnMgb3IgMjAwIGZpeC1vbmx5IHRpbWluZy1zd2VlcCBydW5zLgo+ID4KPiA+IEZpeGVz
OiAzYTlmNjZjYjI1ZTEgKCJSSVNDLVY6IEtWTTogQWRkIHRpbWVyIGZ1bmN0aW9uYWxpdHkiKQo+
ID4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiA+IFNpZ25lZC1vZmYtYnk6IE15ZW9uZ2h1
biBQYWsgPG1odW41MTJAZ21haWwuY29tPgo+ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9rdm0vdmNw
dV90aW1lci5jIHwgNyArKysrKy0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBBSSBkaXNjbG9zdXJlOiBJIHVzZWQgQUkgYXNzaXN0
YW5jZSBkdXJpbmcgdGhlIGF1ZGl0IGFuZCBhbSB0cmVhdGluZyB0aGUKPiA+IGlzc3VlIGFzIHB1
YmxpYyBhcyByZXF1aXJlZCBieSBEb2N1bWVudGF0aW9uL3Byb2Nlc3Mvc2VjdXJpdHktYnVncy5y
c3QuCj4gPiBUaGUgcmVwcm9kdWNlciBhbmQgZnVsbCBLQVNBTiB0cmFjZSBoYXZlIG5vdCBiZWVu
IHBvc3RlZCBwdWJsaWNseSBhbmQKPiA+IGFyZSBhdmFpbGFibGUgb24gcmVxdWVzdC4KPgo+IFRo
ZW4gZG9uJ3QgeW91IG5lZWQgdG8gYWRkIGFuICJBc3Npc3RlZC1ieToiIGxpbmUgdG8geW91ciBw
YXRjaD8KPgo+IEFuZCBhcyB5b3UgcG9zdGVkIHRoaXMgcHVibGljbHksIG5vIG5lZWQgdG8gY2M6
IHNlY3VyaXR5QGtlcm5lbC5vcmcuCj4KPiB0aGFua3MsCj4KPiBncmVnIGstaAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
