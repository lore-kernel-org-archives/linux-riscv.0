Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73DDCC982FC
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 05:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bXcN+aH1RMiaJW4R1VyQw1vnIcrHtTqy2l8v3eaSWJI=; b=AeS5vMG5I82xrz
	P+zGUtm0VebadfGfDya7Z0i8ZQygem5J5s7Oy8EbpDaoHxhxsujwD5VqktOXVV4FP0RrAlmTUu/2F
	gyATbvOqCzyIn6hleo7fWIBpuekyC3mB0yRBbtORyA9CkJ/BcPbIurwg+ErjCbEhoVoEGxkYyYW/+
	Eel+ekWjBPOlBvR4bq4LY+Jjm33MaPrXHDBCscvSJfc3i24P8OXoMwtOSYJxysvyH15beX3CfU1Xc
	MTVjTKsNJ6FsdwszFU1KYrj+DhCdyrMPq6q2yJxW7HQppk74P+WyjXeer3okV6BDF/uwZDe9c2RIB
	CS2+gbi7mRtqeDlneKuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8WOc-00000000u57-1Yyv;
	Mon, 21 Sep 2026 05:16:54 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8WOR-00000000ttP-2ybE
	for linux-riscv@lists.infradead.org;
	Mon, 21 Sep 2026 05:16:45 +0000
Received: by mail-pj2-x0f.google.com with SMTP id d9443c01a7336-2d747ee1f38so25692675ad.2
        for <linux-riscv@lists.infradead.org>; Sun, 20 Sep 2026 22:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789967803; x=1790572603; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=38kXP5y7t8yIDd2XgtSWMeypsNJyNTHpui685k0AnDQ=;
        b=MKj+Ppn9/5nW0UFtdvT3vrAs+LXrYEfdeQofHkIBtHEwlMeYwyNMnj61cHNGcMlDYe
         Ho8zWkN5NqYuBibxTspB/BVi6fsezFgmtV7Zsjhv2f7l3ebWPtVLNxrEbDHflgroYgsf
         q2OyLqcL4kL6QWj4+666z3bLluUM16InfIGON77FZRm2MVxS94xY4el01otJWQIDiC+2
         AJ+4YTCtFzAl9RjKj5EV7Dkjur4KYja73FtGKg62dXLnGkkIKAQx3tGhNwLdpyVVbb4P
         ck0+xmSp/7iZKoxUjQVIw1f8BLZxvTxMpzIz+h/ACdpj8Eu3E7Zo8hbLkXopSqs7wCGW
         XpcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789967803; x=1790572603;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=38kXP5y7t8yIDd2XgtSWMeypsNJyNTHpui685k0AnDQ=;
        b=1hwKNSd6166f2OeX3CY9YiOmOcBnVX+K8j68uBhPlcrgyms485HOm6Dxb+1SItRQt1
         8Qn57HnICWScs3/2V1e9+1PVioO3Pr1bE7C7/gWLkTayFXIEhLPUTQqQuC2w8KSwIb2c
         CJWLJFoeQmBSJ217Y310fkfhhOv+bgY8b/i6UXSGpuCKdbGTWNBJHm2YAiDmg0WDM1cI
         5APA54dE4StirtGxQ2LeKDwWUBfLMPCnJMXpkq/Q+5vCA5RV3NFzavLDcJDnNj9jVKX9
         AFFn4zHZhvI5Els39LOO0t6VhPBAKoAYEed6UoZZ8/xW+1sdZMWWnVlDsrNdxZPUQdwn
         7tSQ==
X-Gm-Message-State: AFuF++lHx+zMScMoPDIWy7kXiGs79ar6rifjORv8R8J+1tKzzLqgOUrK
	7SmujaHouAhd2GScJUX3RiwMMbPRM8JYBDj5iqu4S4MW3Os7MnTRmQIt
X-Gm-Gg: AYBFou1kOpL6E75s3aA67P93IAMvCabcoZezbQ95dDVtj32QhYG9Fgkm+601Q08oJRM
	skPhF3Gi8Oc3Xj/szKK0Z20TURugSz14rUnV+vlAJJwol3oMLXoNYgoRkG3hPdmxkKWKKTYX317
	TTfCloUaOB7HZbT3FgYU5Hizn10SMpgwXZfC2d6YAHsoP++DnK4lJ7Ls4uRD5J5Jajz7A/AbK3h
	+zh0uMuaIbN9UZaUBMpElURqn5I4gswWZA/QivzU1dcvnR+17bAfVbhb3TLWfNr5eHS3eBfw5Yo
	pOiHX3fewsVFj1hc7w3BKXF/KEv0Ma8jyuv7D1nyalT6MvCbsXj7NmMSiieKP0Wiztc2dq8QpzX
	2Mj5qGtkBF+lTQZGAr4mhyfQz+S5yVTHMR+QjfYQ137/LYY8xlrCD9SwcMZ9qohqXfUDP0/7kGE
	maTJfStWvWh/NZmxQonqughJQJPaS8M1hx10VtLEpy/lGLdD+EiSn93a7kkL1Kpr10+JvVP62yN
	Zq8OoSVPlifsfNL9TVRN0svvMv5x2bpZKYhv5BHkAHMgx2k
X-Received: by 2002:a17:903:ac6:b0:2dd:ad73:5b71 with SMTP id d9443c01a7336-2ddb1d5a667mr133827755ad.33.1789967802768;
        Sun, 20 Sep 2026 22:16:42 -0700 (PDT)
Received: from [192.168.10.146] ([67.174.242.98])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c32f17dbdsm17114682eec.1.2026.09.20.22.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 22:16:42 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH v8 2/2] clocksource/drivers/timer-clint: Add T-Head
 C9xx clint
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Jesse Taube <jtaubepe@redhat.com>
In-Reply-To: <20260625134752.3107959-2-jtaubepe@redhat.com>
References: <20260625134752.3107959-1-jtaubepe@redhat.com>
 <20260625134752.3107959-2-jtaubepe@redhat.com>
Date: Sun, 20 Sep 2026 22:16:37 -0700
Message-Id: <178996779710.23212.16488712177302270116.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789967800; l=495;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=3g1zbiU1QK5zke0/S4jE/NxmBKVwHjzxstpSj/Q5/eE=;
 b=wAMUNHIueVGYaHUdxdg6y4PVoMywnzwDXfAPCRf7vEWza/xyfEXl6N3XBMrpn6lI/R+smnLHT
 5Sicpzx2vIrB2yYGQYK0DhAUA+u54FoHteuPV4wfeDDqQZadvJbdVXL
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_221643_780527_E1D85C59 
X-CRM114-Status: UNSURE (   8.01  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jesse Taube <Mr.Bossman075@gmail.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 25 Jun 2026 09:47:52 -0400, Jesse Taube <jtaubepe@redhat.com> wrote:
> To use the T-HEAD C9xx clint in RISCV-M NOMMU env, we need to take
> care two points:
> 
> 1.The mtimecmp in T-Head C9xx clint only supports 32bit read/write,
> implement such support.
> 
> 2. As pointed out by commit ca7810aecdba ("lib: utils/timer: mtimer:
> add a quirk for lacking mtime register") of opensbi:
> 
> [...]

Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
