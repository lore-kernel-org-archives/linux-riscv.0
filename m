Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA415C77B6C
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Apr 2023 00:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KvdLd+aNGydivw3zIumInNiSy/Zsj1iO9iq2E6c98HE=; b=27kZu8rPcuCBvy
	fZwsfg3JBabwPKjjw5rDCuF5tmlTfk8XuARQZZvB2oa9/FwyUrtPS3caWuCghX3MhLgUaz9UU6roZ
	/DSXSoHoQFwDBi5JHi+teyijAUW7BqTLBurbxFgKGwudQVy1woNn2I9BITeiJ3gVfdUJB3/YX72G+
	s5kLGcckPRmm4vmFK8hniZMtGI7836uwPg5C9nauUJhJ2dESxoQM+OOQddYr+eU/vyw4ZWU/5xECa
	U8OFa8IPYsxI99h4ALnenEAQo1Rf3ObBSjURAdL+yFqmdDDlJNdiT1VQ88i83Dw9nQmVkftN0rAQE
	jLCoBy4UF2zZeATOua+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkwHR-00BSXH-0R;
	Sat, 08 Apr 2023 00:18:09 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkvHT-00BMqW-0d
	for linux-riscv@lists.infradead.org;
	Fri, 07 Apr 2023 23:14:08 +0000
Received: by mail-lf1-x130.google.com with SMTP id y15so56070704lfa.7
        for <linux-riscv@lists.infradead.org>; Fri, 07 Apr 2023 16:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1680909239; x=1683501239;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QLCKLoInrHAdRrt/0I6H7kvsHh1I3smFNdrczzyqv/Q=;
        b=1BVMFc6cnJvNZ3RCGog/TgUAVTShIApspugpWbu7eb5NWMCf7pwShOSSgxqtalstr7
         /5oEqJlSLieSR/6Fbv9vqMSMmsb7NEJiC1iv1Sl8e8N5TRv6Kgmgs2RNyOtD/3+lS/HB
         VC0jNqy85O2whn7VfMZxF1x5AuNlf45ENRtquDzLd3lJ72FprgdTNqXMSC66Bkz5kraO
         5sH4rcSJ8RwJREALKSNnUUEjeiYuMBnaHqHe+Yzew0lJll7GhNquiEhAg7iHbYkgiLOR
         8tZTJrI9uxuOzfAplYHdH5oerDH1tIxhUTEqK9hp5AvToRNly5zYVQ9c2uoXtwMPlZMQ
         Npog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680909239; x=1683501239;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QLCKLoInrHAdRrt/0I6H7kvsHh1I3smFNdrczzyqv/Q=;
        b=K/GOQkdziysUKL80IMPGFBOldaZwyaoChiBcifjJ24lRfNthckI8zpwB02Vce3X15I
         TV/dweoWQSjbJo3b5rK1ffm5dBP+sCu8ACJDODKaeD9YumimHQQAW9o7E2p6U2gym3N6
         pF2/ZUaKt0g5znR27h9UEMvXbW3urZpK76zy6GLtDStCx+ERpg2BI7QEJf/+/MX7idWw
         +pJwUvTbd8SvuEhZNfGS13uNDPRc9B3ylv7X+ptiUjKLKBzgRpHAzXCNB8IycvSPwgWg
         5aLBqBCA6ABhzj/t6PfbVoGVnIT3qZutu4BSLtdiOfBsWy4gDGTfZUG4BjPRA+/t9qmf
         cChQ==
X-Gm-Message-State: AAQBX9eyD75ufIfC1IIqJJVqBipAc+P+U/U1h5gQikuVpknZiCu9l3FF
	4U+17V4zDrC3G/+jf9eNjjZEehkkDzopENxDN/xw0g==
X-Google-Smtp-Source: AKy350bzm19IuX0j9iDEEWmFoH1N6yWiSVZDoy915nZ//DbP2dy6HrkAEPcTK3qRSxUvCqRvZzChy9AaY00tladbUn4=
X-Received: by 2002:ac2:54a5:0:b0:4db:5133:59a6 with SMTP id
 w5-20020ac254a5000000b004db513359a6mr1120101lfk.13.1680909239626; Fri, 07 Apr
 2023 16:13:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230327163203.2918455-1-evan@rivosinc.com> <20230327163203.2918455-3-evan@rivosinc.com>
 <alpine.DEB.2.21.999.2304051354280.19052@utopia.booyaka.com>
In-Reply-To: <alpine.DEB.2.21.999.2304051354280.19052@utopia.booyaka.com>
From: Evan Green <evan@rivosinc.com>
Date: Fri, 7 Apr 2023 16:13:23 -0700
Message-ID: <CALs-HstVAGX476SGi_+ct7xxWrBeSE=nGVqckGjm9xo06K-Mww@mail.gmail.com>
Subject: Re: [PATCH v5 2/6] RISC-V: Add a syscall for HW probing
To: Paul Walmsley <paul@pwsan.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, slewis@rivosinc.com, vineetg@rivosinc.com, 
	heiko@sntech.de, Conor Dooley <conor@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner <heiko.stuebner@vrull.eu>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrew Bresticker <abrestic@rivosinc.com>, 
	Arnd Bergmann <arnd@arndb.de>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Celeste Liu <coelacanthus@outlook.com>, Guo Ren <guoren@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Tobias Klauser <tklauser@distanz.ch>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_161407_233064_A227BF9F 
X-CRM114-Status: GOOD (  14.70  )
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

T24gV2VkLCBBcHIgNSwgMjAyMyBhdCA2OjU34oCvQU0gUGF1bCBXYWxtc2xleSA8cGF1bEBwd3Nh
bi5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCAyNyBNYXIgMjAyMywgRXZhbiBHcmVlbiB3cm90ZToK
Pgo+ID4gV2UgZG9uJ3QgaGF2ZSBlbm91Z2ggc3BhY2UgZm9yIHRoZXNlIGFsbCBpbiBFTEZfSFdD
QVB7LDJ9IGFuZCB0aGVyZSdzIG5vCj4gPiBzeXN0ZW0gY2FsbCB0aGF0IHF1aXRlIGRvZXMgdGhp
cywgc28gbGV0J3MganVzdCBwcm92aWRlIGFuIGFyY2gtc3BlY2lmaWMKPiA+IG9uZSB0byBwcm9i
ZSBmb3IgaGFyZHdhcmUgY2FwYWJpbGl0aWVzLiAgVGhpcyBjdXJyZW50bHkganVzdCBwcm92aWRl
cwo+ID4gbXthcmNoLGltcCx2ZW5kb3J9aWQsIGJ1dCB3aXRoIHRoZSBrZXktdmFsdWUgcGFpcnMg
d2UgY2FuIHBhc3MgbW9yZSBpbgo+ID4gdGhlIGZ1dHVyZS4KPiA+Cj4gPiBDby1kZXZlbG9wZWQt
Ynk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgo+ID4gU2lnbmVkLW9mZi1i
eTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBFdmFuIEdyZWVuIDxldmFuQHJpdm9zaW5jLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBDb25vciBE
b29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+ID4gUmV2aWV3ZWQtYnk6IEhlaWtv
IFN0dWVibmVyIDxoZWlrby5zdHVlYm5lckB2cnVsbC5ldT4KPiA+IFRlc3RlZC1ieTogSGVpa28g
U3R1ZWJuZXIgPGhlaWtvLnN0dWVibmVyQHZydWxsLmV1Pgo+Cj4gRm9sa3MgYXJlIGFscmVhZHkg
YnVpbGRpbmcgUklTQy1WIHN5c3RlbXMgd2l0aCBjb3JlcyB0aGF0IGhhdmUgZGlmZmVyZW50Cj4g
ZmVhdHVyZSBzZXRzIGluc2lkZSB0aGUgc2FtZSBMaW51eCBzeXN0ZW0gaW1hZ2UgLSBqdXN0IGxp
a2Ugc29tZSBBUk0KPiB2ZW5kb3JzIGFyZSAtIHNvIGl0IG1ha2VzIHNlbnNlIHRvIHBhc3MgdGhp
cyBpbmZvcm1hdGlvbiBvbnRvIHVzZXJzcGFjZS4KPgo+IEJ5IHRoZSB3YXksIEV2YW4sIGRpZCB5
b3UgaW50ZW5kIHRvIHVwZGF0ZSB0aGUgY29weXJpZ2h0IGRhdGVzIHRvIGluY2x1ZGUKPiAyMDIz
PwoKVXBkYXRlZCBpbiB2Ni4KCj4KPiBCZXlvbmQgdGhhdCwKPgo+IFJldmlld2VkLWJ5OiBQYXVs
IFdhbG1zbGV5IDxwYXVsLndhbG1zbGV5QHNpZml2ZS5jb20+CgpUaGFua3MsIFBhdWwhCi1FdmFu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
