Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA74BC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Dec 2022 17:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RV9SYjrOv+vJearXk36lQWeoYzLsDepVbtBdLGuM4Zc=; b=dHHXn5Y2Py2AVz
	kdjGjsm+Pv37IBqkwAcKOXhXn+W9FGLeksCYCmI/rqeePGhuT5fzcv9oDSPH8fqWjBLiNdDuRn+gO
	ptW1fhGM10x8IdrwlZpAUc0391m8gMG/trDHeOoTME/c4Q16ox65K4jWnKRIdoeC60Ws7e4zz+KN9
	rYmHl5nPilv5D8rtngGlxX54kXL3N2d9+Vk+oKl0DkyMXXgFL8SqxdJ7AAY3YjFcA4n0iwrMjdSMQ
	Y9lBHO1hShpDjlzfLD6N1csHuGLAzbZg2CqTDL+SXSu9HhaOWzIkFQAgyt8Q3locujg5SaKXaZjWG
	Ygn/Em5/6Skh7hdIDouw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p59G3-003n5N-J0; Tue, 13 Dec 2022 17:39:59 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p59Fw-003myQ-NM
	for linux-riscv@lists.infradead.org; Tue, 13 Dec 2022 17:39:55 +0000
Received: by mail-pl1-x634.google.com with SMTP id g10so515716plo.11
        for <linux-riscv@lists.infradead.org>; Tue, 13 Dec 2022 09:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=22ObQGxg+tFUaeC+8ZZZyuwT6ARH/aXdjVJKbHdOy44=;
        b=URZsnF5wMVvtSu7sYKk1PLkEIeFVIi7BWgYDjhE1LUeEL67l0ur1pafnT7b4yE0N/t
         +KpU+8OBbftjRfDvLYMCXqJDGeBssIpZo10KsrzjRQoXFQOya0NMF+LD2j8AMrUJrzW/
         ve/E+3HjTFyawNdVDvfRf8XGe0v4CZtV8GRgIgCg1zlZWHfEFlVgEsX7Pct5C6a5wwJ4
         bxomtJD/zLE7AFdWuRPg9oVZr36WsZJxXWFabR1xK0iWqmnqh/wZHCYbxbl1CnHgdQJU
         /X6a8hruLn3TxDjh6tEFVWnqP0doCZD7VCopFnvA93Elx/4jGDdLCMCp3gTd/MfiaGBX
         6/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=22ObQGxg+tFUaeC+8ZZZyuwT6ARH/aXdjVJKbHdOy44=;
        b=EP50dT7bvb2BdLrWWV1lOef/tihuWjRS8cgJtloSazbnWFgymgS91DJX1jgHfXvYm5
         ANv23vRbt4Hq0pE6b6bZWNu1PRbjyhdz8dBEBsniz8XqT6H1sYXwTZOyFK4rwktgiHix
         EHw7BzcvKfTBeJFoxb5BeDDL21sRb7qwt1GPLa/U90STw5AQ2sqCnttU7on+FfA/y5sL
         P7lBPiQ+dma2x5E0ENaNl5SMZwwRFO6FUZ6Pje+BcFYwKpRwZ//J3JdYc15bYqI2/rWh
         rpp2bREFjsVJg/w8JIvfnW+UAPI+eUK4Gb8xev6Ak4fb9uVUg8HJlQe0sPAp35/RZ5hD
         nJBw==
X-Gm-Message-State: ANoB5pn6L10AAl59wmaW/UqHB+W4JG2uUwbtStZ5OPab8KrBu4WZ0Zbk
	/pwxWXSuDlFTgL+ckv5Zqjtsfw==
X-Google-Smtp-Source: AA0mqf5To8as2YcpcxnoSETfteJYs1LY13fx/hUL7Wn1CurlZTVGERzkFiFuTf8kp3UXKidYBcf8dQ==
X-Received: by 2002:a05:6a20:549e:b0:a3:218a:c761 with SMTP id i30-20020a056a20549e00b000a3218ac761mr31611098pzk.5.1670953190283;
        Tue, 13 Dec 2022 09:39:50 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id l5-20020a639845000000b004767bc37e03sm7100779pgo.39.2022.12.13.09.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 09:39:49 -0800 (PST)
In-Reply-To: <20221207091112.2258674-1-guoren@kernel.org>
References: <20221207091112.2258674-1-guoren@kernel.org>
Subject: Re: [PATCH] riscv: Fixup compile error with !MMU
Message-Id: <167095316650.17956.4201047992243402866.b4-ty@rivosinc.com>
Date: Tue, 13 Dec 2022 09:39:26 -0800
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-e660e
Cc: Conor Dooley <conor@kernel.org>, linux-arch@vger.kernel.org,
  linux-riscv@lists.infradead.org, Guo Ren <guoren@kernel.org>, kernel test robot <lkp@intel.com>,
  linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Conor Dooley <conor.dooley@microchip.com>, guoren@kernel.org,
  lizhengyu3@huawei.com, liaochang1@huawei.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_093952_788174_66DF4721 
X-CRM114-Status: UNSURE (   7.27  )
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

On Wed, 7 Dec 2022 04:11:12 -0500, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Current nommu_virt_defconfig can't compile:
> 
> In file included from
> arch/riscv/kernel/crash_core.c:3:
> arch/riscv/kernel/crash_core.c:
> In function 'arch_crash_save_vmcoreinfo':
> arch/riscv/kernel/crash_core.c:8:27:
> error: 'VA_BITS' undeclared (first use in this function)
>     8 |         VMCOREINFO_NUMBER(VA_BITS);
>       |                           ^~~~~~~
> 
> [...]

Applied, thanks!

[1/1] riscv: Fixup compile error with !MMU
      https://git.kernel.org/palmer/c/c528ef0888b7

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
