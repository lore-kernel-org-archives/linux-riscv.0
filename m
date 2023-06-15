Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69536EB64D9
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 08:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D7inkTmtlCm2wg4Fu+jHMVaXHttywGI2WSp1pmZQJWk=; b=Z85xU9VfQ73scY
	G4E1BbudZw9Dg+h13hADjxZLsv/VmcqJK3pI+jCiZoCz0HsBluMfVkhfcR1tixC0dzdldY8qXwK8X
	+KCR7sxk1Lmm3ehOtEmRXtCWFMnaKOUAev6JppGFkMdIkXEMGUjba+143u1Ffjw4fQUFLxTR/GVHQ
	eybRR73Z504VwRdc1ToZZn3U9GeWV5aMoN765JgWxhKtu2Vsdh6nPXNiRxRFiGGkMHA2Pxp7LGNIg
	ceRG1kYkHhs/xwWNpShZfiQcg3Dr0fAzNcm38btd3a7QzIWpGqau5stAb0m8nifF+MMQon5GwX1C9
	3QdlgTzBHyAG0ZC22DxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9iZd-00ECe1-11;
	Thu, 15 Jun 2023 08:43:21 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9iZa-00ECbq-13
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jun 2023 08:43:19 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1b4f9583404so14732005ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jun 2023 01:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1686818597; x=1689410597;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=djE35uiKoDJkBELybDAy6zrBT/KEuH7lg20w5HL8OIY=;
        b=QqPI8xpLPmGC1VUHhEZqF9m8pfEZc5F7rQ9HwV11V5rYv34qGXIBI5I8zcxtY8w4gW
         ahQIJV2jGimkpyg+fazOPuRZvSaTOAvZ7UbsnVuDoBAbWMiNSbU8RP91ZC7fmmXhQqWC
         BfjU5mq2wNzzszH6v1+ERjlBsf/6pRvaPCSMwllaZ2uVN+5sKWGk9xtJpq/5+popzsQp
         tcOcc20Tz7ct27XOioTCJbFIAv+8zF9jjg+lMU9bESZUe/XPyCjp+f90jSYxC5UUiT2I
         afUxlQFi5JS6sZGqTsxaGo+LjopI/sBPoQ/dSej0xytTuVcCLxxInM1kMcJmhSAHK7Uz
         OMjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686818597; x=1689410597;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=djE35uiKoDJkBELybDAy6zrBT/KEuH7lg20w5HL8OIY=;
        b=HTAKfRDN0QS762xI07TkqYu78MBhZxaKm6781dQt73KstV52b84qvdKBaiC/9h7roc
         jyItVNjYGH4zihSyY9aRqtdIEJCMcsM+HF7IkXVZ7rhfsiyAQ+FAgLuidmYEdUFk+4CH
         GtasfhHcOdf/zRL7XdIZtNIOXhyPPQuAC/UEnW8zEwuGYiyJUKxPK0x9ooLXlT/T3ICC
         ujoRBgLJYtE+GHZeUsLthXOzsaEl46zVQFk/7HPqzrcZvaMeRR6/30ra7Ay+2PFG1FeO
         /qnljOybU0BokMFfx4AKAZ88oEVspwnBruK4CS///LTKW06eSSVsUMk809nkNh0JvBnk
         CAnQ==
X-Gm-Message-State: AC+VfDxE3Kyo9FRJBIiO1jfdceQvsd51KlhenbCgkbwuIx7dVgBO3ck2
	waQYD0DHbZ0bykYcsITj2JX8tg==
X-Google-Smtp-Source: ACHHUZ7TP5umPAvpA0pHF7cTsbl4emR6Y7C0VriWXSS/QRksuYjbYBE+NxzIR4v6A/rc1ydUyNW/HA==
X-Received: by 2002:a17:902:d507:b0:1ac:4a41:d38d with SMTP id b7-20020a170902d50700b001ac4a41d38dmr17069378plg.51.1686818596657;
        Thu, 15 Jun 2023 01:43:16 -0700 (PDT)
Received: from hsinchu15 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id 6-20020a170902c20600b001ac84f5559csm8370111pll.126.2023.06.15.01.43.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Jun 2023 01:43:16 -0700 (PDT)
Date: Thu, 15 Jun 2023 16:43:11 +0800
From: Nylon Chen <nylon.chen@sifive.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: schwab@suse.de, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, jszhang@kernel.org,
	ajones@ventanamicro.com, aou@eecs.berkeley.edu, palmer@dabbelt.com,
	paul.walmsley@sifive.com, greentime.hu@sifive.com,
	zong.li@sifive.com, nylon7717@gmail.com
Subject: Re: [PATCH v2] RISC-V: Support 32_PCREL relocation type in kernel
 module
Message-ID: <20230615084310.GA780@hsinchu15>
References: <20230615072302.25638-1-nylon.chen@sifive.com>
 <20230615-unvisited-deceit-9beab8ce987a@wendy>
 <CAHh=Yk_=oZJ6eY3jJzLavub5rGsvY=MKv4tGXeiqkz+rgJHwDQ@mail.gmail.com>
 <20230615-luxurious-rewire-84ff9d639fea@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230615-luxurious-rewire-84ff9d639fea@wendy>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_014318_381542_174DA34F 
X-CRM114-Status: GOOD (  17.98  )
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

T24gVGh1LCBKdW4gMTUsIDIwMjMgYXQgMDk6MTE6MzNBTSArMDEwMCwgQ29ub3IgRG9vbGV5IHdy
b3RlOgpIaSBDb25vciwKPiBIZXkgTnlsb24sCj4gCj4gRmlyc3RseSwgbm8gaHRtbCBlbWFpbHMg
cGxlYXNlIDovClNvcnJ5LCBteSBHbWFpbCBzZXR0aW5ncyBnb3QgbWVzc2VkIHVwLiBJIHdpbGwg
YmUgbW9yZSBjYXJlZnVsIGluIHRoZSBmdXR1cmUuCj4gCj4gT24gVGh1LCBKdW4gMTUsIDIwMjMg
YXQgMDM6NTI6MjdQTSArMDgwMCwgTnlsb24gQ2hlbiB3cm90ZToKPiA+IENvbm9yIERvb2xleSA8
Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb208bWFpbHRvOmNvbm9yLmRvb2xleUBtaWNyb2NoaXAu
Y29tPj4g5pa8IDIwMjPlubQ25pyIMTXml6Ug6YCx5ZubIOS4i+WNiDM6Mzjlr6vpgZPvvJoKPiA+
ID4gT24gVGh1LCBKdW4gMTUsIDIwMjMgYXQgMDM6MjM6MDJQTSArMDgwMCwgTnlsb24gQ2hlbiB3
cm90ZToKPiA+ID4gPiBGaXggdGhlICd1bnN1cHBvcnRlZCByZWxvY2F0aW9uIHR5cGUnIGVycm9y
IGNhdXNlZCBieQo+ID4gPiA+IGVuYWJsaW5nIHRoZSAtZmFzeW5jaHJvbm91cy11bndpbmQtdGFi
bGVzIGZsYWcsCj4gPiA+ID4gd2hpY2ggZ2VuZXJhdGVzIHJlbG9jYXRpb24gdHlwZXMgdGhhdCBh
cmUgbm90IHN1cHBvcnRlZC4KPiA+ID4KPiA+ID4gV2hhdCBjb21taXQgYWRkcyB0aGUgLWZhc3lu
Y2hyb25vdXMtdW53aW5kLXRhYmxlcyBmbGFnPwo+ID4gc29ycnkgbXkgZGVzY3JpcHRpb24gaXMg
bm90IGNvcnJlY3QsIHBsZWFzZSBhbGxvdyBtZSB0byBhZGQKPiA+IAo+ID4gSSBtZWFuLCB3aGVu
IHdlIHVzZSB0aGUgZmxhZyAiLWZhc3luY2hyb25vdXMtdW53aW5kLXRhYmxlcywiIGl0IGdlbmVy
YXRlcwo+ID4gdGhlIHJlbG9jYXRpb24gdHlwZSBSX1JJU0NWXzMyX1BDQ1JFTC4gSG93ZXZlciwg
dGhpcyB0eXBlIGlzIGN1cnJlbnRseSBub3QKPiA+IHN1cHBvcnRlZCwgc28gYW4gZXJyb3Igd2ls
bCBvY2N1ci4KPiAKPiAoc25pcCkKPiAKPiA+ID4gU2hvdWxkIHRoZXJlIGJlIGEgRml4ZXM6IHRh
ZyBmb3IgdGhhdCBjb21taXQ/Cj4gCj4gPiB5ZXMsIEkgd2lsbCBkbyBpdC4KPiAKPiBXaGF0IG1h
aW5saW5lIGNvbW1pdCBhY3R1YWxseSBlbmFibGVzIHRoaXMgZmxhZz8KQmVjYXVzZSBMTFZNIGN1
cnJlbnRseSBoYXMgaXQgZW5hYmxlZCBieSBkZWZhdWx0KGh0dHBzOi8vcmV2aWV3cy5sbHZtLm9y
Zy9EMTQ1MTY0KSwgaXQgd2lsbCBnZW5lcmF0ZSB0aGlzCnJlbG9jYXRpb24gdHlwZS4KCkZyb20g
d2hhdCBJIGtub3csIEdDQyB3aWxsIGFsc28gZW5hYmxlIGl0IGluIHRoZSBmdXR1cmUuCgo+IAo+
IENoZWVycywKPiBDb25vci4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
