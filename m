Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFEB0CA0ED1
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 21:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nxbs1SfG8nE2HEfSS4SDUqx8BKLrQg1feiw7bH9sMo8=; b=wHCuznT/4gAHDo
	59LIOD9NOVt+hy96tx/vVH/r+WQpSce7sna+Rb6GLaVnM4bxq9xFor3q/kwuoxoPQ/U/eO5h19iiq
	rnuVq9S4hSEkNndl6Oofi824HpgYkMYY6t3BLoPdfGYv6edl4gPzhwmKsc4mfzUHJKUfw2zNofXfa
	rr3jXkLVtl7OsVfA5nD1OXHy8lEtwWjVkU30a/LHsP9hLXWYBhRR+RcxW1tF9KFsTv6oFP7QQwv/R
	5YCBPH+SbNCti8eYvW2CoMTY3anrYlXE845dAIRaOLiFRH+f5dXspjf7SguQgfvnsmBeOhtKx4KCE
	USHuVUHWuy5DO6+nuZLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo7OX-00000008j2E-1LXu;
	Mon, 18 Aug 2025 21:27:57 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo6We-00000008dPW-0iRU
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 20:32:17 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3e571d40088so28862585ab.1
        for <linux-riscv@lists.infradead.org>; Mon, 18 Aug 2025 13:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755549135; x=1756153935; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9Vn7KGvnJ31CxElASYk+NIfs2sarLTulRtjwYt6vxT8=;
        b=Bd971oTwJmkRS4FygEwn/JfgP/YKIvvx/XdQv//+jLXLrTchNlqTaBeylgjZPKO1m/
         FB9MCj3A6iOOObtGGuxeKMRO0KSsnNkJyanK3DnQAjlFjgD5vM16n5ZOfkkbKb6U7Z9J
         u6r2/7d5B/vQ424jwZHWcBVrzfA6SGb8nNaOZ6sYGOIACxNmkLmrICEZ69LAcjnkLpJb
         6ohJsRoVaZHsnOeXup8mNRN63OE3k/87oSxlYNw6/xXXNAUCQNfgNXtogNT6DrmKwxgz
         5sYxIWlViMpto3RtRyXcZZAGZ3TdYV4cAp3CdU3EeR/vu3vxawS66AwZB6Qw01iQ44LW
         N1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755549135; x=1756153935;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Vn7KGvnJ31CxElASYk+NIfs2sarLTulRtjwYt6vxT8=;
        b=c0u8NAO7pwJtfX+bKSdKyABU+krloy3hWnhMwP/NO+O1cq2fNsaS698NBAJA8PqAu9
         jBXl8U5yEZcBdTL5V5QTqBoMlKMwaZWf/y41aPbmn/phBpbX6YQPDWN+7FSqwM+he+8b
         nMO3YQgXJVQTWWdZwACqO5LfsSzr5uYad7/CqgMLywOcioYD9GbPPGf+fuu3D+pJWMIK
         Saol4N0Lg88FnVte+YYa5TMOn3dn1roiwOqJLrHuygJ5Aowgk3+t/E5VkxJMEx6VWLOk
         o6it0cT6uyXNFLn+5FFf3Dm6ZVS8jeaPKfoj5tvaTDhVes2lUxYRcTKUKWNQ0pK8AGnX
         qe8g==
X-Forwarded-Encrypted: i=1; AJvYcCW3liJjKt6RzzdPCS3v38Q7V+7d/uCRpiVv2BS2MkDSoye9RdGxVDLISCPEJa2YRoxeUaimWCvMe9f7Tg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzKr9VgqHx8+owVEB88+LwHc72Uy9xOcKVfvQVRwQzqIVpAkUe7
	GdVjmrNLiXYfK5RFSOpmKk9JuVk/YJ0iPIi8/DxoN5Qzy+VEqBUcwK3/pg63P6Zed7w=
X-Gm-Gg: ASbGncuktAJl9BxicAiriefZGOoMau1mmaYjOj1nTfR8AtVtiV3QFUkXhFMXz1KPgDW
	gZ3DTv6/Ut6gfIWiKJU/MSwavGu49/rkOyUE0JdFuUNsjL0+9IKl4YEnO9QeU4Fs2F5XbTt8SJB
	NSdywuBkXps4yU26zpuLGVdKAEQ/xRVzT701EoN8AMNwHl9qiczl8pYnuOQmIKYWz0Y6Mn+BL4t
	MqFMI48TgqZgqb06SAYVAqTyP5ClGFQGnqXJk/VcJvydLLDroy1mDl0BDEiYYP6uDGcP6NRrfLR
	6pFsxwAgwc4CrQr/d8JXkuGISkwyksELoQerDpgJK4X94LkqrVjhVButpgbYikjqdYSXj2Wj0hq
	Q5avCumesdNu1dicL2vdSXsAc
X-Google-Smtp-Source: AGHT+IF/UJeN6VdS70sUHdd0WRTBcf8Mub8fIKvWwcAVcgm38V3gFnMMkeNmKxZ5+rkOte8i+tJYLQ==
X-Received: by 2002:a92:ca4f:0:b0:3e5:1917:585b with SMTP id e9e14a558f8ab-3e676638e2cmr1709575ab.14.1755549135023;
        Mon, 18 Aug 2025 13:32:15 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3e66c6b0b12sm13085315ab.25.2025.08.18.13.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 13:32:14 -0700 (PDT)
Date: Mon, 18 Aug 2025 15:32:13 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: zhouquan@iscas.ac.cn
Cc: anup@brainfault.org, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/6] RISC-V: KVM: Change zicbom/zicboz block size to
 depend on the host isa
Message-ID: <20250818-f6b7d56c16a41351e90ca804@orel>
References: <cover.1754646071.git.zhouquan@iscas.ac.cn>
 <fef5907425455ecd41b224e0093f1b6bc4067138.1754646071.git.zhouquan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fef5907425455ecd41b224e0093f1b6bc4067138.1754646071.git.zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_133216_218418_EC6C4CAC 
X-CRM114-Status: GOOD (  11.91  )
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

On Fri, Aug 08, 2025 at 06:18:21PM +0800, zhouquan@iscas.ac.cn wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
> 
> The zicbom/zicboz block size registers should depend on the host's isa,
> the reason is that we otherwise create an ioctl order dependency on the VMM.
> 
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> ---
>  arch/riscv/kvm/vcpu_onereg.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
