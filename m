Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0959C46CD2
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Dec 2023 08:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=13WwRqinNIzM8Ap2ItjPsWI5agcCuJTTxmKP3y8csaQ=; b=IaKSE+bWYLN/05
	ihmzf7LApgHEwdFYw0piBye0vy/lHgmc4caHtClkwfE2m1vBivrF2bDakh6kKcdUyGTG5OFpVYjWL
	k38Ut7zUwQBj1aECbvo8q2zJtDUgPpk3B4wczcZJBU3RdTT2JeufdYpJMlTwTKJMCbq5iQrOzqBaY
	QTaS7naNhnvTnRTAo6vpLcHtkGYcdiZ+scSXLCu+iP7NuCTWrf2V0dekYlWokpV7Np9LgchjmjKr2
	sFuwjZ7VFaAR2U92ZeAKynOmBCsgOxr8dMsEY+vP9VZN7OZtlSKIovKGk4bTG93REzP4mUK0SLao2
	NzBfnNYBushVV89F+qdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJUGl-002NAP-3A;
	Sat, 30 Dec 2023 08:00:31 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJUGj-002N9l-2z
	for linux-riscv@lists.infradead.org;
	Sat, 30 Dec 2023 08:00:31 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-36011002a61so14472055ab.2
        for <linux-riscv@lists.infradead.org>; Sat, 30 Dec 2023 00:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1703923228; x=1704528028; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CsK9GSl9KoT/t/1u9XM1rWvytVRiMpi1HhinaJeAPjc=;
        b=S5JsZ8x22hMBxuN00PdMCu4qA13hANLNyV3Mpx3HphY1hXbxyhrxpxPpyPFcob+bRU
         cWbmhKzSEc0WLwWxkbe3aOGII0NMboMrNPEMSgabVWet/TPYENNgDfVeKo/J901QQ4LC
         q/IyGxREZg4VhdE0zENiw5b8EfjYXLrNAwdJ85hop12tOUQJpyXXhaxOWf9UmuoSttR+
         hoogbnHjL+IF/Gm5O51SSFACeZq4G4+2gdxjrMaHJ+2lL+yGHD/L4FxWPLm7aU5pdAsa
         GV05cgP4aCzsVQjERrJAAZdMcRtBSJw4K8pfuOccZWlm06q6uQ7m0FiD9I5lALvFU18i
         R/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703923228; x=1704528028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CsK9GSl9KoT/t/1u9XM1rWvytVRiMpi1HhinaJeAPjc=;
        b=ogEKBRXudsUykaRv4I+ci9nFJRziAcmhXiFRVwqLQgr8q1pMtdj4TcRkbkVDKS+SL6
         31ljBJPPcodJBIjNCfhmi8EwGIIFEPsECzhEsJ2rYjfa6u8Hvf968wp8YEV0tjSVFZ4F
         d2qN8wIatwf65cb2DAl8aJB/a1Kik0AgMTtrp3mHq306FKMBCAlH7aRWkgxIXikfO3a2
         P6nmmzoEEmTlvOD6OHDAfj8hfAMHlGlizgKbBmudZLKp3P07UEiv9wu1heH9vRdtJueh
         gsVrPBCR5G7FxwKzd0VXVQq2MACGTFMrniai3V5EmoZg+fBtg+aT15h2w/1iyMLPCvTz
         /sbw==
X-Gm-Message-State: AOJu0YzrNTa9Ip4OX7LYZD8o1PGg/6kCseU9PCtMZXv7iXMxPlIyyVuV
	zXgh3FFLZWwa8lF2Z1XkgB3oZ1qy84zRFiwZKp8o9Ffp0U1B1A==
X-Google-Smtp-Source: AGHT+IGu2cUegqoSzVonPWO03edgnNv/GRIV30A6bBS7SKvohHEYUnxkoxharU9wnyCuzq/VdjOsac56Up2x+iMOOJU=
X-Received: by 2002:a92:cda6:0:b0:35f:f007:e904 with SMTP id
 g6-20020a92cda6000000b0035ff007e904mr11167470ild.50.1703923227751; Sat, 30
 Dec 2023 00:00:27 -0800 (PST)
MIME-Version: 1.0
References: <20231229214950.4061381-1-atishp@rivosinc.com> <20231229214950.4061381-7-atishp@rivosinc.com>
In-Reply-To: <20231229214950.4061381-7-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 30 Dec 2023 13:30:17 +0530
Message-ID: <CAAhSdy2sce_joq3g230npQ5mHOL48bekzS2ChTsvtT=wGZVCvw@mail.gmail.com>
Subject: Re: [v2 06/10] RISC-V: KVM: No need to update the counter value
 during reset
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Atish Patra <atishp@atishpatra.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Guo Ren <guoren@kernel.org>, Heiko Stuebner <heiko@sntech.de>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231230_000029_982454_D791A098 
X-CRM114-Status: GOOD (  16.81  )
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

T24gU2F0LCBEZWMgMzAsIDIwMjMgYXQgMzoyMOKAr0FNIEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IFRoZSB2aXJ0dWFsIGNvdW50ZXIgdmFsdWUgaXMgdXBkYXRl
ZCBkdXJpbmcgcG11X2N0cl9yZWFkLiBUaGVyZSBpcyBubyBuZWVkCj4gdG8gdXBkYXRlIGl0IGlu
IHJlc2V0IGNhc2UuIE90aGVyd2lzZSwgaXQgd2lsbCBiZSBjb3VudGVkIHR3aWNlIHdoaWNoIGlz
Cj4gaW5jb3JyZWN0Lgo+Cj4gRml4ZXM6IDBjYjc0YjY1ZDJlNSAoIlJJU0MtVjogS1ZNOiBJbXBs
ZW1lbnQgcGVyZiBzdXBwb3J0IHdpdGhvdXQgc2FtcGxpbmciKQo+IFNpZ25lZC1vZmYtYnk6IEF0
aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVw
IFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUmVnYXJkcywKQW51cAoKPiAtLS0KPiAgYXJj
aC9yaXNjdi9rdm0vdmNwdV9wbXUuYyB8IDcgKystLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
a3ZtL3ZjcHVfcG11LmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3BtdS5jCj4gaW5kZXggODYzOTFh
NTA2MWRkLi44YzQ0ZjI2ZTc1NGQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9w
bXUuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11LmMKPiBAQCAtNDMyLDEyICs0MzIs
OSBAQCBpbnQga3ZtX3Jpc2N2X3ZjcHVfcG11X2N0cl9zdG9wKHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSwgdW5zaWduZWQgbG9uZyBjdHJfYmFzZSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHNiaXJldCA9IFNCSV9FUlJfQUxSRUFEWV9TVE9QUEVEOwo+ICAgICAgICAgICAgICAgICAg
ICAgICAgIH0KPgo+IC0gICAgICAgICAgICAgICAgICAgICAgIGlmIChmbGFncyAmIFNCSV9QTVVf
U1RPUF9GTEFHX1JFU0VUKSB7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiBS
ZWxhc2UgdGhlIGNvdW50ZXIgaWYgdGhpcyBpcyBhIHJlc2V0IHJlcXVlc3QgKi8KPiAtICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHBtYy0+Y291bnRlcl92YWwgKz0gcGVyZl9ldmVudF9y
ZWFkX3ZhbHVlKHBtYy0+cGVyZl9ldmVudCwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZlbmFibGVkLCAm
cnVubmluZyk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKGZsYWdzICYgU0JJX1BNVV9T
VE9QX0ZMQUdfUkVTRVQpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiBSZWxl
YXNlIHRoZSBjb3VudGVyIGlmIHRoaXMgaXMgYSByZXNldCByZXF1ZXN0ICovCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBrdm1fcG11X3JlbGVhc2VfcGVyZl9ldmVudChwbWMpOwo+
IC0gICAgICAgICAgICAgICAgICAgICAgIH0KPiAgICAgICAgICAgICAgICAgfSBlbHNlIHsKPiAg
ICAgICAgICAgICAgICAgICAgICAgICBzYmlyZXQgPSBTQklfRVJSX0lOVkFMSURfUEFSQU07Cj4g
ICAgICAgICAgICAgICAgIH0KPiAtLQo+IDIuMzQuMQo+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
