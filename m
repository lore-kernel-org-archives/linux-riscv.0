Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A16C7EE24
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 03:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AYszN8PKg80L7EBcndsynSfIhVrDQHZX9GnhJuLbGKo=; b=3DpzHNbRF+Olo0
	DMa/0HAbbVyF047bTivbdsmojmmH4taF7SiqAO61M23P4jQSr71n7Oi/sqEzh8QoVjxcWT7xeOeVX
	noKjT/huEbTfbKMuDA7we8TOKhl0UvrCTSAksyQkiTGIKd9i4N60CKNtGyGV8FNcQQnw8cGY9S46S
	pMxewnbW+/W+jpaX4zNmlULnrGJNLhD2squ+lrmvfTWK0lV7E8gIeHtQgnLT4LTo0PsNLMpiWBd9C
	oV/V2608l5725ZSSsaNEOYfTiRDt2DS1Nh4BB7ddWozP6PxIf3VvM9DT7TbXDbAefjUo7S4eJ2gCF
	ymYElNJP/wOpZcAGhoHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6NQ5-00HZz9-2S;
	Tue, 06 Jun 2023 03:31:41 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6NQ3-00HZxm-0J
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jun 2023 03:31:40 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-977c89c47bdso469591566b.2
        for <linux-riscv@lists.infradead.org>; Mon, 05 Jun 2023 20:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20221208.gappssmtp.com; s=20221208; t=1686022297; x=1688614297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4wndiCL3ooX0unGrdnlGJh/CooZNsl4DJY/nw60Bvyg=;
        b=4TRPlzmgxwVP4N8fCb9RZqV8HP2cOLntI5VkdodB0q2HH1Nh3nliJ06uBXogZqvlRh
         n0Ux0Sg/MwrolvFP0BlIZBqOOMuEawIj0/4iHJnz2AIIkh4EIpYwcXNQY2yHffTqjSwK
         ub+KmHvGOASUEhHANwD2GWK/czhgqWLIZoor/CjWQvsmNZQN1GHtz0V73BNKvrpIIbWQ
         LhOMozGqRslMCUgEf9ZBTaJ0JI3fUmRe9u/AQWBayZYhtLGZZw5d+Zn+Ztmx4VxC8PHV
         UM58F5k1N9OCzT7+2aZrnm9+mMUeANgphTgzhJX8R8/6kx2zFDHtzkqYhNcSJ2RMkScc
         vF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686022297; x=1688614297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4wndiCL3ooX0unGrdnlGJh/CooZNsl4DJY/nw60Bvyg=;
        b=dHaDtXOuCLcbI4AGqcIA8uQHNwgGbh4VwjbwInyRFcAMpeY7/viyK0us3X0vlNTyEI
         dZgobiup43avnzxNCv2qtltVAG5Ei5MC+DNxVg/2BnuA0DdnNWRCh/hvdp/tOFVdw2fc
         x9eFTnxsWuM3dXy89pkp+Youzb8QEVrOfuXfJF6ihBsPxU8IVT6/DcEmBt2d2Nwuo/H/
         Nyx5uJffQ74vezOL3dxSonSx8PHhpBbAfB7HaqSqNAy+/CR1hIhsavkDWK9LXbAl/Y2X
         Uddv5KzR0u5Vupe7jpPHUsW7v6Krm7sFq1ObvhJ89ChJuoPA+YgrskoxbLrivkH0qWet
         vt7w==
X-Gm-Message-State: AC+VfDw2jg/05O8jjhyXhsS8RCO4x4GnIRfeyTb0rIRurBLCowHTn1v6
	qig1jB1lbAS7GHv8MhboYEyaSbFJafgnPlkrqL1SZA==
X-Google-Smtp-Source: ACHHUZ7QVZa3RQDP+a9VtfAzcQwf4YFT2UhxLoxBDM/IYolOEXUPpKLOggoV+GzyCKjIgfGl5Xi5Ec22NKzBN859hBs=
X-Received: by 2002:a17:907:c11:b0:973:8afb:634a with SMTP id
 ga17-20020a1709070c1100b009738afb634amr899934ejc.54.1686022296937; Mon, 05
 Jun 2023 20:31:36 -0700 (PDT)
MIME-Version: 1.0
References: <202305061710302032748@zte.com.cn>
In-Reply-To: <202305061710302032748@zte.com.cn>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 6 Jun 2023 09:01:25 +0530
Message-ID: <CAAhSdy3isg4788uz=fP6DCTD3LgVbXz9Ud7aoi2VmEbRKYkW6w@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: use bitmap_zero() API
To: ye.xingchen@zte.com.cn
Cc: atishp@atishpatra.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_203139_376046_C64A5220 
X-CRM114-Status: GOOD (  14.06  )
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

T24gU2F0LCBNYXkgNiwgMjAyMyBhdCAyOjQw4oCvUE0gPHllLnhpbmdjaGVuQHp0ZS5jb20uY24+
IHdyb3RlOgo+Cj4gRnJvbTogWWUgWGluZ2NoZW4gPHllLnhpbmdjaGVuQHp0ZS5jb20uY24+Cj4K
PiBiaXRtYXBfemVybygpIGlzIGZhc3RlciB0aGFuIGJpdG1hcF9jbGVhcigpLCBzbyB1c2UgYml0
bWFwX3plcm8oKQo+IGluc3RlYWQgb2YgYml0bWFwX2NsZWFyKCkuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBZZSBYaW5nY2hlbiA8eWUueGluZ2NoZW5AenRlLmNvbS5jbj4KClF1ZXVlZCB0aGlzIHBhdGNo
IGZvciA2LjUKClRoYW5rcywKQW51cAoKPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vdGxiLmMgfCAy
ICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3RsYi5jIGIvYXJjaC9yaXNjdi9rdm0vdGxiLmMK
PiBpbmRleCAwZTU0Nzk2MDA2OTUuLjQ0YmMzMjRhZWViMCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jp
c2N2L2t2bS90bGIuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3RsYi5jCj4gQEAgLTI5Niw3ICsy
OTYsNyBAQCBzdGF0aWMgdm9pZCBtYWtlX3hmZW5jZV9yZXF1ZXN0KHN0cnVjdCBrdm0gKmt2bSwK
PiAgICAgICAgIHVuc2lnbmVkIGludCBhY3R1YWxfcmVxID0gcmVxOwo+ICAgICAgICAgREVDTEFS
RV9CSVRNQVAodmNwdV9tYXNrLCBLVk1fTUFYX1ZDUFVTKTsKPgo+IC0gICAgICAgYml0bWFwX2Ns
ZWFyKHZjcHVfbWFzaywgMCwgS1ZNX01BWF9WQ1BVUyk7Cj4gKyAgICAgICBiaXRtYXBfemVybyh2
Y3B1X21hc2ssIEtWTV9NQVhfVkNQVVMpOwo+ICAgICAgICAga3ZtX2Zvcl9lYWNoX3ZjcHUoaSwg
dmNwdSwga3ZtKSB7Cj4gICAgICAgICAgICAgICAgIGlmIChoYmFzZSAhPSAtMVVMKSB7Cj4gICAg
ICAgICAgICAgICAgICAgICAgICAgaWYgKHZjcHUtPnZjcHVfaWQgPCBoYmFzZSkKPiAtLQo+IDIu
MjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
