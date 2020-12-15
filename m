Return-Path: <SRS0=RRT7=FT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AC20C4361B
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Dec 2020 23:39:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AC2E22CAE
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Dec 2020 23:39:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AC2E22CAE
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=yahoo.ca
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:Message-Id:MIME-Version:In-Reply-To:References:To:Subject:From:Date:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zxW45iJEp0RwYRaQpQ55+QARTZeLnQ+E58fumjkI/S4=; b=iagR9lDh4gTbOdVD4BXRlu0zRo
	49B5uIXxysDk/QmCy50kMPaJu9QNkEeW/bU2XV1m8VtT36EjKwpJA48o9jfTPJMSEOIgJ2sfEqJ67
	QGtuuxxOQBwZbFmadw5+3W82BFZ8wbivkVvSFGBTzNcUuXmNIQ2D2z/aFxz2x6wynQZQhbj8dUehR
	pJmUJHdb4AORgrcxDLT/FQNwjAPfS9JFoteyvrjVyiAO63YaBOTokyjPhDBPPnN36R2d8YWvuGVCW
	mbPV83v8E9WJY9LCIOA8aRFKuwgHCKc6zO2FWt3jrWf6Y36e95gfGCm/FAtgo7S84hz0jKdDW8ebw
	rTc6MB+Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpJui-0001AT-4a; Tue, 15 Dec 2020 23:39:28 +0000
Received: from sonic305-21.consmr.mail.gq1.yahoo.com ([98.137.64.84])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpJue-00019q-W1
 for linux-riscv@lists.infradead.org; Tue, 15 Dec 2020 23:39:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.ca; s=s2048;
 t=1608075561; bh=ZkwtcN1Znn8ElcNfcf+qBswC+LM15JB4pYSZu2ijlTk=;
 h=Date:From:Subject:To:References:In-Reply-To:From:Subject;
 b=bsOksqOjy08JRuM1vNMYKY63ugniz6HKC1zmUhBC5VKH2e12SAHB008RzBECewMo+icMFJI6NYQhG4/OH7Z/GLk5hLZgxT6F8kZiz5UMvuAYx2D/hINMWnQtozRzOnLfAyfg4lGjSjjFIIidoNVJcMiw2bwjvwedEWRGxpRnyM3Ldt3qrWOgqFbOOiBgI3BZuVeYXjfeaWjeGeT0MBIBWTGZika6x6BAqY+x1IAlvkfZB4WTzvSUQjuyI/HEv0kpieYrUu5GWR9OVUjFxGsut6hwHVFFNYOj3DlUB/PQIYAldTAgtvZgISakZfFzJiNQVM/20ujq6L1prYQ3+1aTYw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1608075561; bh=sa9UqAHRB7t41f/GLWfHt+ZwGcZHRuwzz9vsWaaIuHi=;
 h=Date:From:Subject:To:From:Subject;
 b=jBqLOED7uPJH+hPV5WVZNIV/P86RjHeCPnWryS+Z+teP5vUvDvppKa/KgpFjsDGAyX9x5IVqe+MNZRFJB5wO7GjSO7NrcrdbtS1i1Cme4DGBGEmM0jUIHuBXr+OHecGvV7frx91OwbA8b5xY+qrzhHM/5e4s7p781cSM5YNwfIKpYsLgKfnFNg83UyrBfJWg4ioEuMwW13uUB7hTvBTivVGYHzSpMaP5scMnwuPq4A0xgJH7L62FGyU7yxofnHAZEjRZVoCzfy4+YdMpUhltJUNVEe2aZs4O59gIQy2zlFm0AkPZB1YIqvAWU3PE6Sh8JQefZqwhHUv/kiFoAQioAQ==
X-YMail-OSG: JulUi2QVM1nOM7VAg5vRbxJvcPrCfaXBKUng8mGlePCsxSIq3rtbyl96cSN5qFK
 7.h4Aa88liq6HVnGOUXcsPeXL74TBWciCtyW_KeIQUDxofTYYXt5IHkQm_umaVImY3W8liebEIU4
 szvNP5o2H3HY3PIhLLi9iNOUkBJ2yguyZZ4umprzcIXvxROcjUkrtUF8dVFU5Y3xwGuCdvPCLPqj
 mLREEVIFTPri8ysQqktoHfLQdaQYt8xV18xWtfZtrMrOK_JzwXGk7SW7sYwSNosu9uwQQJEIYp25
 cTHfIxdQVf4lWmsA.CIzdUsg8QPSpTavYfCr6LO0SfIZRWuzGApiP8U6LWearQZG1UoSMaGOlmvV
 QK3kWN4RGWv9HSH1Hg82mcZreKjG.nLZe.u_SHz2u_rWetzTpPUsB1yRuKpBnteJnWvrO.qum9.z
 mv0L0fE0DATM5I0.NwaT7tn2NiCPFmwsqfsc9.kyWtiASArq.zAo2RpYFPlBPXhEbPBlCENQEQKv
 s5QeeeNSDN1OwLxmgN5B5wiM7K_r72En.FDRAtdIxWMRCAOJKiCjmnzIEoMIk3FFRaoSWD9jNBrW
 Oax9cagl6c79yx1SMZUw7ySAIVUiSnngUQlsee9F1VF7DviJZxvYlHBMNbteIpirbYjbC6Z9rvGd
 uIH6K0NPiK9DtjyFmrZzLewFlF_wE_jjzO.nvjjRG5DkZVtY4xYLtBfRNyfvz.5E4gb6oRmifOoI
 yfzOfhS68sbdmcv.z2QoB95lDfu3Lh2usQc9_iLkRfF2x0fJZKLWl5yMHJXhjqc5CL0OBrD_Quwn
 vlJyTIvFRHi9cuQOYThWQ7mmLMLJno6OSpcAiAh_Ov4rS_62MmN5bX.L_8AtKoD663erfbVNhRAK
 _rkXoHsNSR41yhY_.keMq9DQU_iI2kQWkNUYGpVI5GpnJWjdlBqWagg20f40YxDoPHDa6tXsqhlb
 ZZA.yEr0wXymIX4mjuMRnTLupT1nD4oq_M65fcyBFE.nyrW3Fet4XndSxEbOE.bwMM60PNwxD1Nz
 eJvvTM6.CqVT_feH0fVAhigwiI4l.YfplONEEAyRsLwhS_HH6gbt4JPTz6fLQWku6QOq5lpehXsZ
 KUeYwDTIJkmNzjjmCeg3GbP4xFEhYYaUIg42LJ.97ldAT9iYf8g.c7P.7KUMMArV5ypQrnw1j6CD
 0JxTjhsdTnF49PUfrYa0s_MEKYvrly5B2WyCbpAcG9EFoTFhU.LWSbdyHz8C.Dcva4VHJIgt8XYf
 Gi5MaKoYfAvOC4MAgTmJ4ZOg0q3eMDsHGs.gyr.XUwV6rOJIFsQkmWHe5rSAMGlXIPUW8t8tg3dJ
 EvwOP9NXlwMJ566bOyAKEwOMCM34ICqvVjQsUOrkPwQ4lyO74vG6CfNeJQLhgtteaNJckXbbMYom
 0JTVZbosF0m5qEi1TVusHClEGP7Z4xbDXarz8NRWZI_ZNZFL.tIYlsO22EHLzE22YQPFWcWAkth1
 NZ_M2bnWezpO5GVnUliz65SktX_0SpmT5rqk7GR_19caN3LB.MaDOkY4ecZ0XcBRN8uEIFI64YWy
 1My91erfKvO3oXGTtA7m7jZSqJjGz3K7Il_Tb_XdT8YVxK._qI6DnY0Qp4Yh0m5nj4k9R6JN.Ikx
 VasRMIlnL.xwcgifvV.4GjcKSJahPRp5GpCTEBPcurH1zDt9QwztI3Zv07uC5koUrcwqGNtnc3XD
 gFmL1quC.BGbahu9v8eRrCAEIppDmZO.72mlMtzLhZENeSQiSuo4cPtoMsGBJN_KUy8VeztqYzFD
 EfxCmL21bPq.A4QLIFTpRzDhKirGiOWr0Bq2IHZfHT5ijhUpfqv5K.6JgXPa1IMg7DM_Gow4vzuP
 SeW27Y0P4zHN3SxUy2r61UDe1ZbNJ9k4MwzC6YoC_d6QOi46NjldipKhbIqHo6o71_eEjH9uwL_i
 _zgJQIT_J3itRCrREf451k4iZvlUlSyX5IczmCMYrOsE7cfoqb0Nyc7DTrbKJHMnBwBJix09Ckpz
 .teceLV2ymIU0aOOwiX.44MLRrUl5Wg7YYqY8CI2J7cC3fPw5cIxg5O4UXv7pvPyVvE2W3hJgO9F
 wrGwyKCcY0bXQu3GN6OoCkX6jNSHTPoYu5k7WLYoK7tcL3eS0LE5PG9xVEoyy7oXWUlyZshME2qI
 KO_DK.c_1z4S77qdx7g5kAF.OHVQX6ndSiRlwpiBBGFE2ThKR.xWlfNg8OtjD_wkPzbb8jPOhVmZ
 _pWEzmIMWTGML6UG6XRrr26iSpK.L_5qJkOWiU_JTnF0dRNmoQeW6JpP_jzs8qwn3izwaxkDlldY
 4.oHtiHpqde8T4uIl9ob33_.aMuSa_PkLK9CJYHa7_B_gmqr37Xx9ToobzNTJjlOlg5SwfFGAHk7
 3vK2RZcMYwoQjAmf3xX38T1lWinVefLaW4ivnACyz9UikzJX0SBJKjQLkSc_afdyIjXARY_Urvn_
 QMkkwGljA8VbvJ2CWPJ0BMEmUwiCYzPtTyHlmQiOv9yAAxhuCg32.jgPJVuvGU7Iet6xroUXpqsM
 t99A9lEGlYWGE_SBf56PyMeXAk.yv3NBa7T4I43u.X.xjVy7D01r4ED5lpaQ7RCnx.XfVJFK6Btg
 sQRdIz_UER_rNkMUrGDlzs8dnJMpxICv7gh0fSIrB4JgTsIn9g3Oy5eZZvHp5d6lEj6PgrUHyrSu
 qCDbrnZdiqIFiE3TS9ywhnHJKOP31TMCVzhypQtBC9KPedUuZe0GGlqPLWBVgc2E6nm8L4s2b56N
 UlyZdlKFUyeBoFy8vhS8Q1XuFHcLinhhwKHbG8s60WOAZAmRNkYJ1AEtD_trNzcKQ7a8f.oS6a8I
 _UgJD1jFuMJeAjp4Nd2zY.fTu_1t5CBIPBgaVlesmI_6dUDjGS5M6zjHuoD.IHF5YAwJNQW764XX
 hYuc-
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic305.consmr.mail.gq1.yahoo.com with HTTP; Tue, 15 Dec 2020 23:39:21 +0000
Received: by smtp409.mail.ne1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
 ID 7f42f66753ff764add4cd34d24e29391; 
 Tue, 15 Dec 2020 23:39:20 +0000 (UTC)
Date: Tue, 15 Dec 2020 18:39:17 -0500
From: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Subject: Re: [RFC PATCH] treewide: remove bzip2 compression support
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-xtensa@linux-xtensa.org
References: <20201215190315.8681-1-alex_y_xu.ref@yahoo.ca>
 <20201215190315.8681-1-alex_y_xu@yahoo.ca>
In-Reply-To: <20201215190315.8681-1-alex_y_xu@yahoo.ca>
MIME-Version: 1.0
Message-Id: <1608075451.ootu1tx25o.none@localhost>
X-Mailer: WebService/1.1.17278
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
 Apache-HttpAsyncClient/4.1.4 (Java/11.0.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201215_183925_263050_A799CBD5 
X-CRM114-Status: UNSURE (   5.27  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Excerpts from Alex Xu (Hello71)'s message of December 15, 2020 2:03 pm:
> bzip2 is either slower or larger than every other supported algorithm,
> according to benchmarks at [0]. It is far slower to decompress than any
> other algorithm, and still larger than lzma, xz, and zstd.
> 
> [0] https://lore.kernel.org/lkml/1588791882.08g1378g67.none@localhost/
> 
> Signed-off-by: Alex Xu (Hello71) <alex_y_xu@yahoo.ca>

Upon further research, I found that bzip2 removal was already 
implemented as part of zstd addition, but were apparently abandoned in 
an effort to get zstd in. I will check those patches and try sending 
those instead. Thanks to all reviewers for comments on this patch.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
