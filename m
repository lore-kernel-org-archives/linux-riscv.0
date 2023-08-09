Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23DA0C04A6A
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 14:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LSRINhGhrUY8JxGwQDKvO3Gsndc6ozC1DVcy+W1fOuw=; b=KIm0WU+rCCVoE/
	FI5BDhImYDx4xzXyGvw/RDgofr037oV5E0ldUfw7f3m0c4LuYkPMnd4r1YVGJd7BuK5qG0iyV80cc
	Uy+l1LYjcG0QbCtr5YsHgYOiavBR+wK55MhPRZwgYfI0BDiVBHMpg+/K+oGFlJtW0Pc+bHQvFyCXY
	NkUub0lj+GSl0ElRf+vCuTf8diSmyUfRB534nls8XizdCJMM0CCC2UtPptO6DnTglINmoLDQ9KNmJ
	KkPgp18+R+EgTkoQ/GJ7a8lv4TaqWtD9MFhg9E8e7SkY6Q4rdz5+LTB2OWK/vFW0aX+STK8Lz9YSZ
	TX2dK88blOZfzrCFrD+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTkI5-005BPJ-0F;
	Wed, 09 Aug 2023 14:36:01 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTkI2-005BOE-17
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 14:35:59 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1bba48b0bd2so45118145ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 09 Aug 2023 07:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1691591757; x=1692196557;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PcSxbBrOV0WBg4EP6zgcLtNj8tR0tgK0git/8kLh/8g=;
        b=iFBxTWYgQIrj4gYHg7URBl9Kl5xOAcVL0HH5/QkB91x4HS9lNi6Ivla71SdJlNRENe
         3POAlQzTPJPQ3Azft+nt3ZFkUvTC+xctOQt7sHY1FIU0BybjtoelE8jK+/csTHOg/CWw
         2LFJwu2hoXwkJ5OXWlBnZfRa6XQpodvXkymXFF7uXChA8KsGQUP3o3K4uA3Yac5it+YT
         TkzwpivjCIFNw1gAxYzFN792eKnjLxRFDxu++b1KjVk2aFVcYvDpWDg/+JSaFdaZ9Xl0
         LSAMZdvIKAJiXQTHAkaBYCV/kZXwBTnDfIkYTt6GkbmW1vqzbTxx8vR5hREY4ztHK3xB
         HUvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691591757; x=1692196557;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PcSxbBrOV0WBg4EP6zgcLtNj8tR0tgK0git/8kLh/8g=;
        b=Z458zjmU29RCptQZwnRtADdi+OQK2bli46X6HbGy+My//stXO7TrsRyvqPApZlRZJO
         kwrnOJRKV+NKjUN5s7+TKHxfW5Oej+1vgkLCAkhKyVttdSg+ghqt4+N+5fU17gNgN2w7
         CnJl6PngUYYEy3zPsSULJFq+Vfm3/71kva1QtfOeh8xUyI0AS+Jf/u1oo03hKFwrQILW
         gHy8FkBIUuPoFSAH4A1PP1yTVx1aXLuSt/PeOJztJd2/f0/6ysB15x4FnyDeXXKXU+8B
         V1X+HgvilSwVy1wkQI9xLwP1eLJrB2U6fsyN+m/RwU834BjYfCKEquORxbESa8qGPVp8
         5s/g==
X-Gm-Message-State: AOJu0Yw6sEBJ76+ouTpj4Ob05DnhMo7UQr7RseZ2g92ebDfwsrSscPQk
	V3kFSgpgwBoayLcy+tqPgNVuFw==
X-Google-Smtp-Source: AGHT+IFdVVu7L+xm66m6ILijRF86owhaQpuq4lcg6v7Vht4/WBr40AzWMsdamMMfe6osPRY5H6pnVg==
X-Received: by 2002:a17:902:d483:b0:1b8:a3e8:51d0 with SMTP id c3-20020a170902d48300b001b8a3e851d0mr2328259plg.45.1691591757300;
        Wed, 09 Aug 2023 07:35:57 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id t22-20020a1709028c9600b001bc68602e54sm7307984plo.142.2023.08.09.07.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 07:35:56 -0700 (PDT)
In-Reply-To: <cover.1690365011.git.petr.tesarik.ext@huawei.com>
References: <cover.1690365011.git.petr.tesarik.ext@huawei.com>
Subject: Re: (subset) [PATCH v2 0/3] RISC-V: Fix a few kexec_file_load(2)
 failures
Message-Id: <169159174235.20984.13290949121654917312.b4-ty@rivosinc.com>
Date: Wed, 09 Aug 2023 07:35:42 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: Torsten Duwe <duwe@suse.de>, Roberto Sassu <roberto.sassu@huaweicloud.com>,
  petr@tesarici.cz
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
  Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, Li Huafei <lihuafei1@huawei.com>,
  Liao Chang <liaochang1@huawei.com>, Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <keescook@chromium.org>,
  Andrew Morton <akpm@linux-foundation.org>, Heiko Stuebner <heiko@sntech.de>, Ricardo Ribalda <ribalda@chromium.org>,
  Alyssa Ross <hi@alyssa.is>, Li Zhengyu <lizhengyu3@huawei.com>, linux-riscv@lists.infradead.org,
  kexec@lists.infradead.org, linux-kernel@vger.kernel.org, Petr Tesarik <petrtesarik@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_073558_389043_736C05BA 
X-CRM114-Status: UNSURE (   9.66  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On Wed, 26 Jul 2023 11:53:58 +0200, Petr Tesarik wrote:
> From: Petr Tesarik <petr.tesarik.ext@huawei.com>
> 
> The kexec_file_load(2) syscall does not work at least in some kernel
> builds. For details see the relevant section in this blog post:
> 
> https://sigillatum.tesarici.cz/2023-07-21-state-of-riscv64-kdump.html
> 
> [...]

Applied, thanks!

[1/3] riscv/kexec: handle R_RISCV_CALL_PLT relocation type
      https://git.kernel.org/palmer/c/d0b4f95a5103
[3/3] riscv/kexec: load initrd high in available memory
      https://git.kernel.org/palmer/c/49af7a2cd5f6

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
