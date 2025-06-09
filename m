Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34DADC61DB2
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jun 2025 05:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5KvhSZ0qdELghqOOaIvTrJvVS8e6t6x+Bp9hgnaoZo8=; b=kRc0p/B0Eh460D
	sxx3wftU/FYgIw04UlTDeySPfZaGC3T7HhwB7bAmYP1gfTE1RreaFv2P4+L5oIRbHDFhsIo03zdum
	RX/WvWvbSzQNOjYgMzI8hffHslactJnmHJ9ANpfWCmhmohNMiAjSH01Aon31mcStt4HJDrr7WhfRL
	18kT2OHCuI9C4mq+WvjKX1U1hy43m9sNOC2c3ruvP4wThre+visf4Z4u1pi733ovHTSS35e5YnrA3
	qJSE+BtG05She5Ibr7cTPeEmRHZ1bVxq9gXPBcgt7W1dfn4gtL5vpINcPiL+8D+SGEvcXTZqKp3bF
	PydGtS54btUEtLlk5Jrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOUdv-00000003Rh0-3YxG;
	Mon, 09 Jun 2025 05:01:55 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOUdt-00000003RgH-0mJQ
	for linux-riscv@lists.infradead.org;
	Mon, 09 Jun 2025 05:01:54 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5535652f42cso3967945e87.2
        for <linux-riscv@lists.infradead.org>; Sun, 08 Jun 2025 22:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749445311; x=1750050111; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qOMcjGbCg5jsFQHyOHp8QkLmffXsMI4hIXBXUWTyrTY=;
        b=afCCoh6updQKGT9lne4Lg9+IHFK0M5rdK2p6eZs1VF8VeO/JXDDqx2HrU++GEUuC2A
         kPBHA88S/AtWJN1XPbBERubStxUgiJK903zeGsQ4hOF2hlok5ss7PKuu5zKDXZb4EHvi
         9I5HmEKljBKdU9EoeHcnVzdqNcYXYc0ihCdiOBsmB1ZGQjy5Zp3D5r9Ctbspx6g2dXbX
         ziF2ThUWb3nxgchpG8mVJa59FWqAs7c5y1ScX53GtGrFx0G5GG1MW/DKxytqE6JP6wyx
         bBHB4421cWc/KgqOeFyldbA62jo8Dy3vX13kXWbX+IYkf0oXIyMrw5MlbeEuTHvitaxH
         chXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749445311; x=1750050111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qOMcjGbCg5jsFQHyOHp8QkLmffXsMI4hIXBXUWTyrTY=;
        b=VIKGQUNmPSJ703N8RcMjUsQoo+8qVszLGemeBx0WOYKQWjUWqCS1GFPf8AkVAjydEQ
         WG0ofd8XOPXBBb+HjUAe85mHONWNr8BN/jdfJT3PprDM3CN2gTK/81mo9r/harmRENCM
         fUPEKT9+CYObq28mjhteR5q6wtUWaG+PBYL7gbZtAZryz3Yx2bqH81QpMLJ8c5EcgB1T
         8g4jUEvr14Bk7jiLPJE75fGycrSkLhm5fKIcEqCjtxSazVtSdiWR6I6oPEgM5vxQo0vO
         dzOAtyhSpcDTsxhfc29jS2cX4aTn/gmPcZLx4RkmuuDNxZ0y/pKA54LNiAgGLT3zXPo5
         a3EA==
X-Forwarded-Encrypted: i=1; AJvYcCW7WcHn4F8J094423cX6XjpS/jMivhYQJwZetMqgHcSTXsqi+o9AMsjzl+wG9/ue6bSu6UzUut+stG34A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxzzC1FRrYTnR06bOUgxNNBbx+V6uIbYCeSt2hmkD1TWUhI/c9I
	BQ2xzSiASg5VOuib1TXvLtVRNHoFGv+eo+BhUE0nVIzBT5Cj80ooXdL+DAagSKVtMVn9qIRGTeT
	6brh8Ir6LfeoiZyuLxcE7iLXUhHCgiP/MA2GGuAczpQ==
X-Gm-Gg: ASbGncsULgIIEXVrX9XWjzP4CFPYXMOEFPMk19au6TU4q0m/6G9KqJdQ8MM7f8NOBO0
	tzUP5zzhb6DgAkDRAaBl4xJFNJ8z/6IeHkejg9zVZOUxNoQROf5UvYv6xk87pen6Cyh8QRYmRpt
	gkM8Nm9DOl2xflmJuTItux6mpD69ooXm843g==
X-Google-Smtp-Source: AGHT+IGNoFMBVcIkhkWIxs1T6dpBKHVyU1+GA9Sn2XOqGmubTKzpGdkqTqGYa5lWFnUt1IGgZ9ywL6/bb9mRRWona4Q=
X-Received: by 2002:a05:6512:b96:b0:553:2e37:6952 with SMTP id
 2adb3069b0e04-55366c35b56mr2725861e87.55.1749445310725; Sun, 08 Jun 2025
 22:01:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250605061458.196003-1-apatel@ventanamicro.com>
 <20250605061458.196003-4-apatel@ventanamicro.com> <ed5276d8-5169-47fc-bef2-bde7b8979e7e@linux.dev>
In-Reply-To: <ed5276d8-5169-47fc-bef2-bde7b8979e7e@linux.dev>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 9 Jun 2025 10:31:38 +0530
X-Gm-Features: AX0GCFu6khb6JAs3hfg5t5-XeCYErlLBCVttXYRvddGA_uZhl6kG6tBxdop0a2o
Message-ID: <CAK9=C2WWtOdG9aYhmrTnDNoV9f0VBYUENJ8utKd=4G9-1SyzdQ@mail.gmail.com>
Subject: Re: [PATCH 03/13] RISC-V: KVM: Check kvm_riscv_vcpu_alloc_vector_context()
 return value
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_220153_215671_BD6B3A60 
X-CRM114-Status: GOOD (  20.05  )
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

T24gRnJpLCBKdW4gNiwgMjAyNSBhdCA1OjQ24oCvQU0gQXRpc2ggUGF0cmEgPGF0aXNoLnBhdHJh
QGxpbnV4LmRldj4gd3JvdGU6Cj4KPgo+IE9uIDYvNC8yNSAxMToxNCBQTSwgQW51cCBQYXRlbCB3
cm90ZToKPiA+IFRoZSBrdm1fcmlzY3ZfdmNwdV9hbGxvY192ZWN0b3JfY29udGV4dCgpIGRvZXMg
cmV0dXJuIGFuIGVycm9yIGNvZGUKPiA+IHVwb24gZmFpbHVyZSBzbyBkb24ndCBpZ25vcmUgdGhp
cyBpbiBrdm1fYXJjaF92Y3B1X2NyZWF0ZSgpLgo+Cj4gY3VycmVudGx5LCBrdm1fcmlzY3ZfdmNw
dV9hbGxvY192ZWN0b3JfY29udGV4dCByZXR1cm5zIC1FTk9NRU0gb25seS4KPgo+IERvIHlvdSBo
YXZlIHNvbWUgcGxhbnMgdG8gcmV0dXJuIGRpZmZlcmVudCBlcnJvcnMgaW4gdGhlIGZ1dHVyZSA/
CgpFdmVuIGlmIGt2bV9yaXNjdl92Y3B1X2FsbG9jX3ZlY3Rvcl9jb250ZXh0KCkgYWx3YXlzIHJl
dHVybnMgLUVOT01FTSwKdGhlIGNhbGxlciBzaG91bGQgbm90IGFzc3VtZSBhbnl0aGluZyBhYm91
dCB0aGUgcmV0dXJuIHZhbHVlLgoKPgo+IE90aGVyd2lzZSwgdGhlIGNvZGUgcmVtYWlucyBzYW1l
IGJlZm9yZSBhbmQgYWZ0ZXIuCj4KPiA+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFwYXRl
bEB2ZW50YW5hbWljcm8uY29tPgo+ID4gLS0tCj4gPiAgIGFyY2gvcmlzY3Yva3ZtL3ZjcHUuYyB8
IDYgKysrKy0tCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYyBiL2FyY2gv
cmlzY3Yva3ZtL3ZjcHUuYwo+ID4gaW5kZXggZTBhMDFhZjQyNmZmLi42YTE5MTRiMjFlYzMgMTAw
NjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKPiA+ICsrKyBiL2FyY2gvcmlzY3Yv
a3ZtL3ZjcHUuYwo+ID4gQEAgLTE0OCw4ICsxNDgsMTAgQEAgaW50IGt2bV9hcmNoX3ZjcHVfY3Jl
YXRlKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiA+Cj4gPiAgICAgICBzcGluX2xvY2tfaW5pdCgm
dmNwdS0+YXJjaC5yZXNldF9zdGF0ZS5sb2NrKTsKPiA+Cj4gPiAtICAgICBpZiAoa3ZtX3Jpc2N2
X3ZjcHVfYWxsb2NfdmVjdG9yX2NvbnRleHQodmNwdSkpCj4gPiAtICAgICAgICAgICAgIHJldHVy
biAtRU5PTUVNOwo+ID4gKyAgICAgLyogU2V0dXAgVkNQVSB2ZWN0b3IgY29udGV4dCAqLwo+IFRo
ZSBmdW5jdGlvbiBuYW1lIGlzIHByZXR0eSBzZWxmIGV4cGxhbmF0b3J5LiBTbyBubyBuZWVkIG9m
IHRoaXMgY29tbWVudCA/CgpZZXMsIG5vIG5lZWQgZm9yIHRoaXMgY29tbWVudC4gSSB3aWxsIGRy
b3AgaXQgaW4gdGhlIG5leHQgcmV2aXNpb24uCgo+ID4gKyAgICAgcmMgPSBrdm1fcmlzY3ZfdmNw
dV9hbGxvY192ZWN0b3JfY29udGV4dCh2Y3B1KTsKPiA+ICsgICAgIGlmIChyYykKPiA+ICsgICAg
ICAgICAgICAgcmV0dXJuIHJjOwo+ID4KPiA+ICAgICAgIC8qIFNldHVwIFZDUFUgdGltZXIgKi8K
PiA+ICAgICAgIGt2bV9yaXNjdl92Y3B1X3RpbWVyX2luaXQodmNwdSk7Cj4KClJlZ2FyZHMsCkFu
dXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
