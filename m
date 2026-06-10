Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D016ACD98C5
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jun 2026 12:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mZ4rZd8Mr4T5j9jCb85wNfbmWa4lKfEAZUTKRXW8sSw=; b=J3tIwAytYBiPsi
	7/Ozd4oZ1Iod7yMb+yvSpiVsxz+RZMB2eg+glfyvxJsa9cSVyPqt0paJg/huruMpFkugeXk3JTEn9
	0lDvB4iiewsatg5LgZmKqNx4hIg5FeiLOkdP56BQi5rjqAuinbno0Aad5Jkuoyb7BvFNkl6+Vnbz4
	UpFAroiQ8kir6x3iFKuE7mra/bkLDbZdT+6a0j69LEPmeAHB2MC1SB4lLZD+69xh8l17KXre/cGzL
	jZm0iDzBnjjMUmhCgVAE0oXJT8Y6AI4KcY4uqv1+mHI7PcI4exU0maJd0C8drou9bdimFnDu5fAWc
	+VsBIHNsvK/rLtVMzGcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXIVU-00000007gY6-2KfU;
	Wed, 10 Jun 2026 12:58:08 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXIVR-00000007gXO-3bbH
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jun 2026 12:58:07 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-91578122305so1068507585a.0
        for <linux-riscv@lists.infradead.org>; Wed, 10 Jun 2026 05:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781096284; x=1781701084; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I/0dsVqT3+rwe8vxTka27s1co61yM446PDMVcSZYv8k=;
        b=eJOox5/1xAjfnAd7i6LLBOkU8O1xi/Wg7gt+EuRa7jNu6BAe4ilnw1gwKXUktAtP55
         V1a6pYaDJRN2Q1zeOtB9jwkdJfrr0qw98Y9UzzZrdMkHPnwG9uregpWi5aPlmAre+tCx
         iuFggzxSnzosPMeNzKPBsTLGHgUa9Xe4FjQICwo6qKX5hyBE8hIWuQ/dGvlm+t6h39Q4
         tc5rnAHEG9uV2tblIkZqwyElJXYa3oXZydIG2wULJfuj+wHHw/S7e2nfzFqwM890U+Oe
         K/mAeJJ4ov3LoflFI0z7XUm9M65B6xU9J9xXU8MuOr+8hQ/F7RV8OYwsaPRP669j9kFS
         iDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781096284; x=1781701084;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I/0dsVqT3+rwe8vxTka27s1co61yM446PDMVcSZYv8k=;
        b=UPEraEXI5b2kY0jGBZ3WCphKciBA996WZB4fRmemm/BJdnhuWfcB0zT/EIwkZeNXCS
         wkQtm6NzxGrWSyC57ycUMh806ujNG2xoEBHxtsD041jdG/ZoAKfe8M8m3K2V0Z9YuW2q
         trr1fbCllQmDvPnxF//B2T4pRQ8nROyUhDoOLr00gUmEFYuunoJxxpaI0HmH+qydPmKo
         U4MEkvfFXQ7dtm6GmvIYtF2juayq/9xr0gHgQidvvL/F6S6VOcosFKBOfa4nQRfI9gdQ
         U8Xj3cXqlR85gWF3L5VZ50zvjr3LlCjJjPmkGFiZIUyA2ghfoYX7OwlBNZXstz5gxEJf
         6cEQ==
X-Forwarded-Encrypted: i=1; AFNElJ97z+nuXuX6oqAJz2AM5Xk1qYNhJSQuqIoc6vWl4Z/ctvlUsQe/dz1syOa3zIMQ7dedgzAuNPd1bstBbA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8SgmvQK7tiZaF6KSvT/CjyM77NH1hcBZPhvb1DctFn6IBW9mK
	9ta/6WeYMS/5tXahmJOEX7bjf52ozvl7SI/r/8oZK2uVDZ2UDVx+Cw5Y
X-Gm-Gg: Acq92OHCi5Fy8MYBesueZ3DF/kR8n1qBufviU+Qt+h+ZSTM0xn5KS44lX5M0v56Bpiw
	4GDR4s1LvuB+B2mD21zWXmChlG55B0Q9a05NqPH66172ZSLt1QuwtiUouaxZZxMoUlChiJSJV6p
	edaEzYuHs8HYG5OacJ3iuIIINHfcbv7HHaeuOoPoCgNCcIwDQSsXkCaRv/C2XwYuTkE26l/bdal
	as8UtSV3yqZBGzb8ZtpTyZCFSLFLONy1hfKC+9xeATCGfZKn2PuJFiSy0EuMtGiiVu98ooHuGxX
	HQ1pkcYwYJq9xtan/khSsxI+MjD4UPjuW0LV8BByQawnx90nultNQ6oYlKbYxC2UsC3UOpr5vDM
	y2dfys4sz8X2DZxa0oQOZysUEA5sJJBKvPjPSYVDFkBLGCSjgCG15x4Q0/whFnDPFBGyDvaVRbs
	ahw9J73/FDYYgEy1UUvhpIlvofnwjYy1t8/5Mp9owe7n1WMHtWds0ILz1BLct9g6Rn7BE=
X-Received: by 2002:a05:620a:2588:b0:914:9bed:9443 with SMTP id af79cd13be357-915a9cd939dmr4259735285a.25.1781096284172;
        Wed, 10 Jun 2026 05:58:04 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a00840dsm2635584485a.1.2026.06.10.05.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 05:58:03 -0700 (PDT)
Date: Wed, 10 Jun 2026 08:57:55 -0400
From: Joshua Milas <josh.milas@gmail.com>
To: Shuwei Wu <shuwei.wu@mailbox.org>
Cc: tglx@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, pjw@kernel.org, samuel.holland@sifive.com,
	unicorn_wang@outlook.com, inochiama@gmail.com,
	daniel.lezcano@linaro.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, liujingqi@lanxincomputing.com,
	alexander.sverdlin@gmail.com, rabenda.cn@gmail.com, dlan@kernel.org,
	chao.wei@sophgo.com, anup@brainfault.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, sophgo@lists.linux.dev,
	hanguidong02@gmail.com, michael.opdenacker@rootcommit.com,
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH v5 RESEND 5/5] riscv64: dts: sophgo: add initial Milk-V
 Duo S board support
Message-ID: <ailfU9PHrm6MDhdR@sleek>
References: <20260530173347.33533-1-josh.milas@gmail.com>
 <20260530173347.33533-6-josh.milas@gmail.com>
 <DJ0ZYF5C8MMH.2GBBY188VVPSH@mailbox.org>
 <aiawOUHBcKtMVEZk@sleek>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aiawOUHBcKtMVEZk@sleek>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_055805_900801_D3156146 
X-CRM114-Status: UNSURE (   7.59  )
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

Hi Shuwei,

I was able to get the wifi chip working. It requires the proper DT and an
updated aic8800-milkv-duo-s driver [1] that has been updated to Linux 7.1.
The next patch will cover the DT part.

[1] https://gitlab.com/DeepHorizons/aic8800-milkv-duo-s

Have a great day,
- Joshua Milas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
