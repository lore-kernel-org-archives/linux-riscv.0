Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B7BC7EE29
	for <linux-riscv@archiver.kernel.org>; Thu, 25 May 2023 20:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gw0TioS2aO55DQPvgBDRYp8eo4xaSHcYx9yGB4wgMPc=; b=bpXAyED4fkhufl
	h30KTcMExRmTp8cZyvsgRyXnbcXvmF1P3sct+XF/C6L6CI+q8KiMLiUBvjaYIH8ysfbCUaXX0oAmb
	ljipreC259i32h2Rm60Yn0hOOHy36VItEpQ6b19PBM6LT1jPM/zgCB8cWwzTZJfr6ESCamQJvOqJT
	zr+zm8PUATSEoSi2s2ooD2HVN9PBuFBqRDiLEWEtrcUqkudnBxxwZX582Y+OT0BKF/6XlTuK8mink
	vFZkCnXUQ5dORJR2WT0uCLdkXc3lNYjENFifnFLekLZJcU+5eBW9wwBd2f56ssPhliXFIz2r3mmhX
	mt36ybGmldkUZpJmiNag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2HE6-0003US-18;
	Thu, 25 May 2023 20:06:22 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2HE3-0003U8-2R
	for linux-riscv@lists.infradead.org;
	Thu, 25 May 2023 20:06:20 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4f3baf04f0cso2901133e87.1
        for <linux-riscv@lists.infradead.org>; Thu, 25 May 2023 13:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1685045176; x=1687637176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U3spcq+MrkOIWF4SfW0stmLuaSodhQuiQ2dFEDG11ZA=;
        b=Y2amLA3bKwVejayNzOT4S2WIDvyXw7VfW5iFKCytn5tcad8JCmmuQb9kunBGUyiN1R
         djsNvbvOhc12DL9y9u5Qm05x3ppmerrqayzEcWr2r6+Ai8goHUIRzFewdMUQ6jkPHJAv
         X2Ymz4SIrraaHvPpIPnbumHz+/QQZc+8b41uI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685045176; x=1687637176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U3spcq+MrkOIWF4SfW0stmLuaSodhQuiQ2dFEDG11ZA=;
        b=ZkbW7knogOVYEfxJLCgzQSgB6NuaBp0uM1j/IKVInJE21UtZPCV0SPI1NREd/q/CVa
         a8z2fk7j9OAjI75197P8aa1IGuWQvIwVL/gILKfQynW/0T6gU1sCIca8V/Ww6IWHGPsJ
         yTsk3vcJp2NOa+EQhW0sjpKg+L720KYUljSd/A2Dqw3L2P0Hs1AtO9yREmdJ1PwTfBBX
         K/nxXQeDIFy+q5rAZ5iuvnHqvUICx9DEA1WgZOqQXDMJBP5hUILP8Hr/lHzTb17gBKo/
         bSNrUks+rxd//50Wjan9Y4MZyI7MH2xQbGO9XN21gRq90FXlMToLEFGKpUjNoSwGCFqK
         MVbg==
X-Gm-Message-State: AC+VfDzl9E6Y8AP9IZY29xQIpitzCZpRrgQP4nDsKHVQElkiZvG1WnYB
	g7WneQWEJlKTZAJiklIfXHEmdSvfv6JmV8CxDtOB
X-Google-Smtp-Source: ACHHUZ7hJ5WkNy8+TAtwUENxM1v6lnmWt2g0rRrlpenYRzRQ/0Ej7gcTYezaDZ+q1V9T2tP6MZTe5bQ4Bb2Ja436M+w=
X-Received: by 2002:a2e:7c05:0:b0:2a8:a858:a4ab with SMTP id
 x5-20020a2e7c05000000b002a8a858a4abmr1209094ljc.39.1685045176486; Thu, 25 May
 2023 13:06:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230525-guacamole-swimmer-68048a73baac@wendy>
 <CAK9=C2WUyLxZwQO37cN-i+V+A3yxmEoaj=uE8yR8nseYTDW7oQ@mail.gmail.com>
 <20230525-postnasal-monopoly-98adb96ffaa1@wendy> <CAAhSdy06nQh4H1FP_K_-VF462mhj+F2M=4AV4QSCUGe5XVqX0g@mail.gmail.com>
 <20230525-shrapnel-precut-26500fca4a48@wendy> <CAAhSdy3SqeLdAfaojUki=ht21nr4ZUPMkW_t9M6ntQCt6Ds4Nw@mail.gmail.com>
 <20230525-citric-waged-a2f78d27eb0c@wendy> <CAOnJCULfC0jmiucLNMeJZwJf4QbGAN6r4B-ubUbP16KVpxrCfA@mail.gmail.com>
 <20230525-flaring-trading-f2bf0713ae26@spud> <CAOnJCUK_EgX-En1QNS8yX1WA1nj8w2kpvXMQcvgWuR3dvzEQYw@mail.gmail.com>
 <20230525-desecrate-imposing-d97ab34e06ad@spud>
In-Reply-To: <20230525-desecrate-imposing-d97ab34e06ad@spud>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 25 May 2023 13:06:04 -0700
Message-ID: <CAOnJCUKfRv68Bh8ue=ZhMGxai9_UEHLpm3553g2c2NXh-RP-TQ@mail.gmail.com>
Subject: Re: Bug report: kernel paniced when system hibernates
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Anup Patel <anup@brainfault.org>, 
	Anup Patel <apatel@ventanamicro.com>, Alexandre Ghiti <alex@ghiti.fr>, robh@kernel.org, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, jeeheng.sia@starfivetech.com, 
	linux-kernel@vger.kernel.org, palmer@rivosinc.com, 
	leyfoon.tan@starfivetech.com, mason.huo@starfivetech.com, 
	Guo Ren <guoren@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Song Shuai <suagrfillet@gmail.com>, linux-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_130619_815637_F177659D 
X-CRM114-Status: UNSURE (   8.98  )
X-CRM114-Notice: Please train this message.
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

T24gVGh1LCBNYXkgMjUsIDIwMjMgYXQgMTE6MznigK9BTSBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBNYXkgMjUsIDIwMjMgYXQgMTE6Mzc6NDBBTSAt
MDcwMCwgQXRpc2ggUGF0cmEgd3JvdGU6Cj4KPiA+IEFueSB0ZXN0aW5nIG9mIGhpYmVybmF0aW9u
IHN0aWxsIG5lZWRzIHRvIHJldmVydCB0aGUgcGF0Y2ggdW50aWwgd2UKPiA+IGhhdmUgdGhlIHBy
b3BlciBmaXguCj4KPiAidGhlIHBhdGNoIiBpcyB3aGF0IGV4YWN0bHk/IEkgYXNzdW1lIHlvdSBk
b24ndCBtZWFuIGRlcGVuZGluZyBvbgo+IE5PTlBPUlRBQkxFLCBzaW5jZSB0aGF0IGlzIGEgS2Nv
bmZpZyBvcHRpb24uCgpOb3BlLiBTb3JyeSBJIG1lYW50IHRoZSBjb21taXQKCjMzMzUwNjggKCJy
aXNjdjogVXNlIFBVRC9QNEQvUEdEIHBhZ2VzIGZvciB0aGUgbGluZWFyIG1hcHBpbmciKQoKCi0t
IApSZWdhcmRzLApBdGlzaAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
