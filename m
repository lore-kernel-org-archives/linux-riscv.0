Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B41C1C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 23:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GoHZnLC1CZgp5Vvd4CcqbYe9h76y7m34Et7bBYR4Pg4=; b=MB+HF/bDEQulx3
	4E7zWHBDuLcDTbE43FPxUd6McA3NiOnHNFFXImnztG6DP86+8yZp/CtuydQzu6MlhfO5CBhEqL7WE
	eMkpbP++5C2plGto+PlxnEr6bKowMZ8rS+UQS/KhvRQYe9oifWEHsEXRQFRah0H4qlILLX/oXP9DT
	AupimCarP6STIkcb7jwg/95rS3SmCBdywpA/GKlwMdz0MIrvkxDMQX+4CKsmQthQDPW02lJtPMNV7
	xRJf64Q66S4+cKqunjprcJU972UUvsY/6VuFxTneA1f4THp+ztVdAe4Flez1U/c+gQtG+NZ0I6V9m
	um95fmzvHrylKbMS/Z2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQGVv-003c0o-Pi; Thu, 09 Feb 2023 23:39:39 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQGVp-003bw0-Mh
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 23:39:37 +0000
Received: by mail-pf1-x432.google.com with SMTP id 144so2400006pfv.11
        for <linux-riscv@lists.infradead.org>; Thu, 09 Feb 2023 15:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Aea3HsUxNusgQ3zGvDAU8d2cl52XwYgouqtSnWkqbdw=;
        b=458+ljGEBNM56QQtoF0+6PY3fNuNOVbyG9JRJz5PylYrYcsdutOuWL0VK/m6ILnSdX
         yn9CBoVbApyoJmuoTmEoOrob+HzBnUGF9rO8INpp37gag784dD5zH/lTzP9YCO2xvO4Z
         Qy/jtfTbgidsnGUgCwSP3Er5Q4q0O21RxVfqe7vg2PW+uz7cNFNlewfMPAvPNU0F2aKc
         r+lIF3DHzKmja6DGCq+Fhk6dXSkf7NEZY/PG/yY4ku/AWkNgMT1F69N3E0cul8A8jlXj
         pcGsvaeGYYbOHAFjMjrB6VG1mKYWEs71zLlyrMzyrkLv0mGecU++n19I881I9NV+f5kZ
         /pdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aea3HsUxNusgQ3zGvDAU8d2cl52XwYgouqtSnWkqbdw=;
        b=2MDtVQsOo+JfDt4/pXzeavClzuEvi+vwBBFgpenvneZh3qVBjEib5VwsyQEsYmsYXn
         ToTpG6Fx5TmvjGel42YsaK+T3xs9/qAAUiukoFpDORBxr8DFRoyE3Aq84efeoPxYy5du
         NWB7hV+vBoHoZj7jfxgbUc0nmfs5SC0csP9yzHL+C1utd6nkWrEZGHtNVtqY7awYDpRT
         YLRPQ3SXxiB8FSTecItROoTLzxx4A+GoDlRWbWL9BxYbPbBbq2SaEk7NzmCk7bvtLzpr
         TaCuCxvkKu97olNVDC4sVTMro9oY67f9yRg3G9sKhf8UENTSHZSl2Hth860uK1NB8su9
         /0KQ==
X-Gm-Message-State: AO0yUKUfUALtNHDUKA9F2FMsuPSwbyb28SFPhsHlfsCTYmM0ZY/xWnhd
	ddDT7BLrihlECmqFRHII00LTMw==
X-Google-Smtp-Source: AK7set+X2eCiOkDYQx/Q7+txzbDHxpSSxEwFLyCSu7sXdR1b984T2SoqWJM+IMS1Rv7dKWmm1AYh3Q==
X-Received: by 2002:a62:4e49:0:b0:5a8:4a4e:78e8 with SMTP id c70-20020a624e49000000b005a84a4e78e8mr5380392pfb.7.1675985970137;
        Thu, 09 Feb 2023 15:39:30 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id t18-20020a62ea12000000b005a851e6d2b5sm1959310pfh.161.2023.02.09.15.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 15:39:29 -0800 (PST)
In-Reply-To: <20230204063531.740220-1-guoren@kernel.org>
References: <20230204063531.740220-1-guoren@kernel.org>
Subject: Re: [PATCH V2] riscv: kprobe: Fixup misaligned load text
Message-Id: <167598585273.27143.7764875060371575014.b4-ty@rivosinc.com>
Date: Thu, 09 Feb 2023 15:37:32 -0800
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-ca426
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
  linux-riscv@lists.infradead.org, Guo Ren <guoren@kernel.org>, =C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Conor Dooley <conor.dooley@microchip.com>, liaochang1@huawei.com,
  bjorn@kernel.org, jrtc27@jrtc27.com, guoren@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_153933_805880_B2D943AF 
X-CRM114-Status: UNSURE (   6.47  )
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


On Sat, 04 Feb 2023 01:35:31 -0500, guoren@kernel.org wrote:
> The current kprobe would cause a misaligned load for the probe point.
> This patch fixup it with two half-word loads instead.
> 
> 

Applied, thanks!

[1/1] riscv: kprobe: Fixup misaligned load text
      https://git.kernel.org/palmer/c/eb7423273cc9

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
