Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED0DAC54E58
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 08:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EtRMZmilUnuXSEaSTT9UQHPYQfL/4A+9wnxswn0mb/8=; b=ceL27+Et06BDzb
	jCIy6T4ofH3/1kOHEf5rnlwiy8beOQb8JXbfo52v3tqGYinxmR6rfSlKaS2NHk7jqh/Ckkyw3dgp5
	r/I8dy4QYuv8i+mfvA+c65wfIbjO1xfoGyqsb5GweKnaQDrHSiknVV8XAxgsFDuG4ru8Tph+LgPaG
	lvu5RqEe81XpXLUdN7nTObjo5utnIlvt4dCDiq4Xa9GLY55yUqz4grjfmfK4/A7pWDWPmslTKFFby
	fT59ycO4HRepOvSyaXuEVaH6kvXOWOxe6yfywqDKxClmuBh9Immuom3XLDaXJ9el/ad5uf0Ihzzp9
	BZieQtQdKUezhiakVzEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rofzr-0000000GFpH-3odD;
	Mon, 25 Mar 2024 08:47:59 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rofzp-0000000GFno-0vQh
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 08:47:58 +0000
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-7cc01644f51so175835639f.2
        for <linux-riscv@lists.infradead.org>; Mon, 25 Mar 2024 01:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1711356476; x=1711961276; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ms4jkXPSE9adqqhEBzf7IdCmvUVjO/xSfy0M32pByFw=;
        b=PSoUu6sBEk1Fi58snrOhwJMU7Lu7CeNqlKGK+Tj62Ue/D+FvB0D/tkCifyWyFTSZAl
         GNTyNjZK2GuaER3ht/z1riEG12TRdmQv48C+meUiW6BKdt5ELfVGHeLHyGKgylXMP6m5
         0hTubWZQXqor32E+aSudtggPuy7eZm3Hw+DmKUskYhcdTrFMptYDCT+IKO7oNht2XoCi
         BuapLd0H9Pku3UeUZmbAHQ/mAjMvZRx5cpIN8AxJ0TDOdZ471lHplTzpkDijq5htPB22
         /OUpuAeLf4ugDOWznl6dyDy2xOaeiiOWkn+XgBBZ8laaOgoOJJJpTNuQhq2YpLMmzDXz
         Hv1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711356476; x=1711961276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ms4jkXPSE9adqqhEBzf7IdCmvUVjO/xSfy0M32pByFw=;
        b=LQ/v96FHtpnhhkU3t0/psZhn/SrsCCic35FU+g7Ho9YvKPcp4Wa14cyKLNsYD1diEj
         maRv2og0QAuQB139xTXWnFKXhUqUmcwxI7l2wBg/7KFBbKf8tOKrI3eghJOWAR92AtC4
         ta6GgmlUgD2GwDXeIu5eSGtvj6oAPRZdqZAu0SFNK2oVl4//FLB+rkyCFs6/KRiCokTd
         UXN0VqPsek2wTNpFN1TrjltKmnsqKM6uL/j3iusyGvZccReBic4kImoNjeoWZd+7fpR0
         s8+5GpdReR2EmUpJsi4/Jcae6gpQh6fvgq/PvrNHsI5Xbn/NM9K/f9IYjTkjoVZF44o0
         G6rA==
X-Forwarded-Encrypted: i=1; AJvYcCXxvurNd5ye1ZPjcIKjkt1BIv5r6dR46lPu2+XGe89TNINEUHncHLyy1356F5eT41USLbD5Wt1Iy7xDmAXEUtFa3i7ok2GvQF+ko/As/5Jx
X-Gm-Message-State: AOJu0YxxMLiMw9saSNCavBX0pQitNaNS1O08BDqqK/9z3Tgskio6HbFj
	AImeypVJVL7loVv6lIO7WP/VmsvA4MMg6J6HnCL6QXyWqKW9yaqG4CZmoyQgbn+BzNWPeoXV7uE
	O2Tf5nM0HWDPrUsBI72BsjBe+4cEZoVyF8y3v5A==
X-Google-Smtp-Source: AGHT+IGSCwvEljJGbfYn9wLE/b5/75aeMuRrUiY3C9t/Q3AwACOXzG/3thuOXyzf1ItEA8Vd59vdH4gk5NwdYae+Ems=
X-Received: by 2002:a92:d744:0:b0:366:ab6f:f63 with SMTP id
 e4-20020a92d744000000b00366ab6f0f63mr6709994ilq.3.1711356475818; Mon, 25 Mar
 2024 01:47:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240315092914.2431214-1-colin.i.king@gmail.com>
In-Reply-To: <20240315092914.2431214-1-colin.i.king@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 25 Mar 2024 14:17:44 +0530
Message-ID: <CAAhSdy2b1nUO5u0cM2uMcow931UX0Q=o_OY_YLQ5+oK499PX+w@mail.gmail.com>
Subject: Re: [PATCH][next] RISC-V: KVM: Remove second semicolon
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_014757_418899_E5C77DDA 
X-CRM114-Status: GOOD (  14.23  )
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

T24gRnJpLCBNYXIgMTUsIDIwMjQgYXQgMjo1OeKAr1BNIENvbGluIElhbiBLaW5nIDxjb2xpbi5p
LmtpbmdAZ21haWwuY29tPiB3cm90ZToKPgo+IFRoZXJlIGlzIGEgc3RhdGVtZW50IHdpdGggdHdv
IHNlbWljb2xvbnMuIFJlbW92ZSB0aGUgc2Vjb25kIG9uZSwgaXQKPiBpcyByZWR1bmRhbnQuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4uaS5raW5nQGdtYWlsLmNvbT4K
ClF1ZXVlZCB0aGlzIHBhdGNoIGZvciBMaW51eC02LjkgZml4ZXMuCgpUaGFua3MsCkFudXAKCj4g
LS0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMgfCAyICstCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jCj4g
aW5kZXggZjRhNjEyNGQyNWM5Li45OTRhZGMyNmRiNGIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNj
di9rdm0vdmNwdV9vbmVyZWcuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMK
PiBAQCAtOTg2LDcgKzk4Niw3IEBAIHN0YXRpYyBpbnQgY29weV9pc2FfZXh0X3JlZ19pbmRpY2Vz
KGNvbnN0IHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKPgo+ICBzdGF0aWMgaW5saW5lIHVuc2lnbmVk
IGxvbmcgbnVtX2lzYV9leHRfcmVncyhjb25zdCBzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gIHsK
PiAtICAgICAgIHJldHVybiBjb3B5X2lzYV9leHRfcmVnX2luZGljZXModmNwdSwgTlVMTCk7Owo+
ICsgICAgICAgcmV0dXJuIGNvcHlfaXNhX2V4dF9yZWdfaW5kaWNlcyh2Y3B1LCBOVUxMKTsKPiAg
fQo+Cj4gIHN0YXRpYyBpbnQgY29weV9zYmlfZXh0X3JlZ19pbmRpY2VzKHN0cnVjdCBrdm1fdmNw
dSAqdmNwdSwgdTY0IF9fdXNlciAqdWluZGljZXMpCj4gLS0KPiAyLjM5LjIKPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
