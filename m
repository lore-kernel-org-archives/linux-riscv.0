Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28DB9C54E67
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 09:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ssvtDUlROaXy6YxRMnGVCIXmDR8CNW8z2k/wkpO1Q2Y=; b=4L6VOcy/I0VIkq
	1qD1Gp3KczXWdBMxSCsdYyqrdtWFViedUf1h/+h9VFUbL6fZD1GysYzdlzC98P7t3CSjssT54xVVI
	9P/pPkpISG0vtdgUX91dpUPTSyn8f6ZjSAjy9ZWH8TZTtN3l6p8t/GtdHFQfsICCM5szM1SUqLpNO
	Wal87mhB8tbXdWr9cgf4oPLwf3NeQuzIcf/cEkFD94Fq+GLFIjX+NmXAPvMYDucnYNwkTsYYBH0If
	p54ye6S3dWl48MeFp+/62+jBA/nHU0f61hjjw/3qnILY9/xs9PhsicGMnmy1Ly1UyQvwebH8UBoE3
	SlujaOuETh1rBAq7jORA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpm3h-0000000DLC7-1qCm;
	Thu, 28 Mar 2024 09:28:29 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpm3d-0000000DL7x-3VOY;
	Thu, 28 Mar 2024 09:28:28 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a472f8c6a55so88859266b.0;
        Thu, 28 Mar 2024 02:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711618098; x=1712222898; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yhDsgsoAO60u3k10g2MJLo0MvaSsM4SCLf4CmYbwMnU=;
        b=H0sYCOUZfoOdWOeRbpc908I61yGgkps1HPofzhIchPU2KdMQomcqf3lNpcsbHmy+kM
         Spv3xSSDiSTjvM+Qy9JZ7BogcfPE+x9L0H1ws82mw1oKPadzyFT4qt/oMX2TPsu1yD2v
         /PLptp9wS6w3a+kWr7u6MHNueuna5PZHakwb3Ey2zZQCukXaawmcTMzCMaDdqoPHky+8
         +JrZCFDbQyaR84GiLrMK8BXLRJbeY1/CMhWIyom4815jo8uBuZhU4vVQKWVWE3ZjFZsM
         jKkWEUJo3A07yoR9vkvQ8P/gSLjczfiib8DrgIfmmvRXAlFQKJQQ5lBZ/gt8iv6mwXAW
         7r3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711618098; x=1712222898;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yhDsgsoAO60u3k10g2MJLo0MvaSsM4SCLf4CmYbwMnU=;
        b=cSjO63En3NiYBOWWoC9Bw+4r6/YoYGWidYR3mrJPS2621LUOuYGg65/sM0jrnjfLYr
         Wx8CXHnqZNWBfB9LLczz66J3VX9CNxsH+xwN+WyGRw2YVANfD/7+FPv4a27j53bxdpmH
         1b+fxtB2cxQPKkOACJUHD1oW3leJuCE9c3bmmd8hD4s+1Q6EjVEzb6IAMl0gjfkOG0vr
         nCJjMK0y7SeK2BhSEQlOQ94bREDu8D6TK7IWtzYR5/nNwMX+7od4Dd/U/VCa9uRgG6sy
         bqdJQtUqhanEbaC8Ndm/jCenL03a+ZgekbjDmFKf/Rv+yhyRNlxWCzGsKAgDNdVCRjlJ
         DA0A==
X-Forwarded-Encrypted: i=1; AJvYcCWzbn3dXX13nwHlXZI1hA/yzw6t4GOxxO9DRfpUq4+qxN4M7PMFNCoS2/4pOS0t0bPa+7CwYPd5STigYI14pjRUHw+khzS4wSrQd+qYFCJh6HD+V+vbSA2hUOoHRPdjgzjWlwO9j4dqKN2xDatXcfHKSezIW5g=
X-Gm-Message-State: AOJu0YwqTv6tZwzEkESod4pIg/FzrONNJYh6ptcKKIm21MGEmF407y/j
	1Nzo+q7kgpLf+w19oLMMb8uR0RDWIacxGN8LNYaDujZakxQKYY95
X-Google-Smtp-Source: AGHT+IF4nGJMSNCV5u3DgVbXNZEHPac9H6U3miurlYMwBj65T7W35FEsQTMN3m6K4hqypNhM2eag0g==
X-Received: by 2002:a17:906:41b:b0:a46:8856:e6bf with SMTP id d27-20020a170906041b00b00a468856e6bfmr1287546eja.44.1711618097410;
        Thu, 28 Mar 2024 02:28:17 -0700 (PDT)
Received: from gmail.com (195-38-112-2.pool.digikabel.hu. [195.38.112.2])
        by smtp.gmail.com with ESMTPSA id qx27-20020a170906fcdb00b00a4750b2e0f0sm519801ejb.164.2024.03.28.02.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 02:28:16 -0700 (PDT)
Date: Thu, 28 Mar 2024 10:28:14 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Rohan McLure <rmclure@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
	christophe.leroy@csgroup.eu, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, x86@kernel.org
Subject: Re: [PATCH v11 00/11] Support page table check PowerPC
Message-ID: <ZgU4LoWBXDeJY8VS@gmail.com>
References: <20240328045535.194800-3-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240328045535.194800-3-rmclure@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_022825_940924_3977B9C7 
X-CRM114-Status: GOOD (  10.31  )
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


* Rohan McLure <rmclure@linux.ibm.com> wrote:

> Rohan McLure (11):
>   Revert "mm/page_table_check: remove unused parameter in [__]page_table_check_pud_set"
>   Revert "mm/page_table_check: remove unused parameter in [__]page_table_check_pmd_set"
>   Revert "mm/page_table_check: remove unused parameter in [__]page_table_check_pud_clear"
>   Revert "mm/page_table_check: remove unused parameter in [__]page_table_check_pmd_clear"
>   Revert "mm/page_table_check: remove unused parameter in [__]page_table_check_pte_clear"

Just a process request: please give these commits proper titles, they 
are not really 'reverts' in the classical sense, and this title hides 
what is being done in the commit. The typical use of reverts is to 
revert a bad change because it broke something. Here the goal is to 
reintroduce functionality.

So please name these 5 patches accordingly, to shed light on what is 
being reintroduced. You can mention it at the end of the changelog that 
it's a functional revert of commit XYZ, but that's not the primary 
purpose of the commit.

Thanks,

	Ingo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
