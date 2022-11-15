Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 451BDC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Nov 2022 00:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cW8jGzSNfLleEzRbQxtAjgAmWQsDA4tPNrb3Hu8CtTs=; b=5BbXcdyPhcgCAbP5L4t8orGRoU
	KpDrvSWKFRsPocQgwZvHGmH+hj92UyAfWXfmlslD+MdCP5GI750WMAZPCxpbnIgU1E+SbucDy4CIr
	hHb/s8vr8SFhPrsIQN/uHZAqw6IwlJG37hp5C6Jqa5ukaSPLCUMfzWbGUO5fQuY7bZPcb22aqOVvV
	odywq59Hj037Xha2OK07LeH+gN26XIz6oriQKYweSHPpF5z38lGznH4FVDuH58bT4cbDh5L4ms6GP
	FMQ5WXP/GB3DmcJ3Ep3RXWn6o0t+gZTnVkAlo3ZWsH5wrdRVTnR2/8V+DKHEIQKRuXslI9A4gkpiK
	mtqc2JuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouk62-006Sgx-7W; Tue, 15 Nov 2022 00:46:38 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouk5z-006SeN-BX
	for linux-riscv@lists.infradead.org; Tue, 15 Nov 2022 00:46:36 +0000
Received: by mail-pg1-x529.google.com with SMTP id q71so11787582pgq.8
        for <linux-riscv@lists.infradead.org>; Mon, 14 Nov 2022 16:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bd5hPyKD2PPr7KyKwYzFS26oIX92ytADq1HkbV02UjM=;
        b=O1sOJD8rtP4IH4Yi70eGOrg+RsIrPwaSI+E7lsjchaR0vsIk4OcsTePfrD0GDQ6/ok
         MQcEhTNegM2MgZX6an+q4qFrc0TLFQKTcxlB5byx9V2OQmw/yqG2IxrUKZ4LJpkwjbqV
         kpXYCE/q5gMp8Dr+etmQpZD5YdgbXCRcIi4dP1hseJ3Vc8FgbnoFeQgznEsFCZ8sc9C/
         +Aq7UmleDQFCoHsOpxUqFAILq0h693d7cSqfrvEGcQEJdSL70r75p1CQVdbYcraVP6Vv
         afDwyZksFmO4iq1RAE78LdBL2zCtVUGqKVr5AbYHWRKQe4sZ3haM6vxe+yhoW+EegNn8
         SrVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bd5hPyKD2PPr7KyKwYzFS26oIX92ytADq1HkbV02UjM=;
        b=zGbyTL316I/YeVoUA2+IOnwrAn99Lru1uWvX1zfl2RBE3Eti/nmPQs+o2dfjztotqY
         QNuTYkOfa1NAV4Ov0SJ7k5OINjgxFCiRz3XMtzX8dk7PIsO3DvFZ4SIs7cikX7yHz8GY
         3p0XreiuUzpq8zdt4g3UAiwV7FBaBCiJZ3WaO8fpY37CL+gGU+BAez3nAlfJ5pdb6FL+
         mJQXlYjwyWBIGXI5uarS/rIPyQBB+Msyvx7pK3sBDr/p793inXwyGLtmlJeU4sZfNnvi
         VCCaQpPJ0YU0kjr2rPuQNeHYdunNQDBTmGlgjLO3SxqIOKHSz4m741UM4LxZFOkVsrWL
         XHjA==
X-Gm-Message-State: ANoB5pkeXg5W5TjSY30LbHVJCTr2WMgNig92AnXHnCKfDhbkI5yHospj
	vUw5OdC3JWoNi2kw924IgVhdLQ==
X-Google-Smtp-Source: AA0mqf6nOJ9c9LDWbjxDMBFuDEMN03fiqfa60Tgw1kwrGN5DHzLmvSOo+bF6ZKKp/POWOk+fWmlLwQ==
X-Received: by 2002:a63:ce04:0:b0:46f:1081:f517 with SMTP id y4-20020a63ce04000000b0046f1081f517mr14083794pgf.297.1668473190230;
        Mon, 14 Nov 2022 16:46:30 -0800 (PST)
Received: from google.com ([2620:15c:2ce:200:d6b2:571a:fff:f8d4])
        by smtp.gmail.com with ESMTPSA id s30-20020a17090a69a100b00217cdc4b0a5sm10323493pjj.16.2022.11.14.16.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 16:46:29 -0800 (PST)
Date: Mon, 14 Nov 2022 16:46:25 -0800
From: Fangrui Song <maskray@google.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andy Lutomirski <luto@kernel.org>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] vdso: Improve cmd_vdso_check to check all dynamic
 relocations
Message-ID: <20221115004625.x4wl6zbg4iiuxl5t@google.com>
References: <20220830193701.1702962-1-maskray@google.com>
 <20220910075316.no72fdyqjvunomwm@google.com>
 <CAFP8O3+OwanSJdzd5V3oGJ_MOJOSVdbn+4iBJJKm2LCR8mCA0Q@mail.gmail.com>
 <9ce45cd2-dcd8-11f8-e496-7efe3649e241@csgroup.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9ce45cd2-dcd8-11f8-e496-7efe3649e241@csgroup.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_164635_413496_C6833A50 
X-CRM114-Status: GOOD (  11.19  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2022-11-14, Christophe Leroy wrote:
>
>
>Le 28/09/2022 =E0 07:25, Fangrui Song a =E9crit=A0:
>> On Sat, Sep 10, 2022 at 12:53 AM Fangrui Song <maskray@google.com> wrote:
>>>
>>> On 2022-08-30, Fangrui Song wrote:
>>>> The actual intention is that no dynamic relocation exists. However, so=
me
>>>> GNU ld ports produce unneeded R_*_NONE. (If a port is not care enough =
to
>>>> determine the exact .rel[a].dyn size, the trailing zeros become R_*_NO=
NE
>>>> relocations. E.g. powerpc64le ld as of 2.38 has the issue with
>>>> defconfig.) R_*_NONE are generally no-op in the dynamic loaders. So ju=
st
>>>> ignore them.
>>>>
>>>> With the change, we can remove ARCH_REL_TYPE_ABS. ARCH_REL_TYPE_ABS is=
 a
>>>> bit misnomer as ports may check RELAVETIVE/GLOB_DAT/JUMP_SLOT which are
>>>> not called "absolute relocations". (The patch is motivated by the arm64
>>>> port missing R_AARCH64_RELATIVE.)
>>>>
>>>> While here, replace "egrep" with "grep" as "egrep" is deprecated in GNU
>>>> grep 3.7.
>>>>
>>>> Signed-off-by: Fangrui Song <maskray@google.com>
>>>> ---
>>>> [...]
>>>>
>>>
>>> Ping.
>>
>> Ping^2 :)
>
>Can you explain which ARCH_REL_TYPE_ABS can be removed with this change ?
>How is the verification done if ARCH_REL_TYPE_ABS is removed ?

All ARCH_REL_TYPE_ABS relocation types can be removed. As explained, the
real intention is to check no dynamic relocation, and this is done by
the new

   cmd_vdso_check =3D if $(READELF) -rW $@ | grep -v _NONE | grep -q "R_\w*=
_"; \

in this patch.

grep -v _NONE is to work around some GNU ld ports (and likely older releases
of some ports even if their latest versions are fixed) which produce
unneeded R_*_NONE dynamic relocations.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
