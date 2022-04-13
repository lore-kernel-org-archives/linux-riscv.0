Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B3FBC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Apr 2022 09:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vsdguwio52Xh5VtePT4f66LXGWa2nUMQZC7DcA4fPnE=; b=Mn/6/uMPGmG/jR
	EKOssS/oobHbC3/gKy5OZrU5PCfkDaA5sZytb3IcWYTeHZIWQEyAHKaIFz+ejFjBGdL8tsci6cUwF
	/Ohdtgcu9Y/d2QPcgTjSbvq/IfSUa6xJ2VB1psH8nBWwLp1bTfvYDudURrX1WhH1J3q7PmMEMfO+t
	p2f79eEyMYG+/0f40YYRxREjHqrnioO5kyu1qmcDavbGSUufuGxHToSzpdI5oA8kYtuk1TW8T7RSM
	9hxmxSSkThi4OAGbGE0Atgs8RfN4PLy5rna8mXcg7ilO2YLdvk/S0ZSZ89lu/p5z8z8JmhfR/Nxvc
	glMFhTciAo30A+eGYPAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neZ5q-000Gou-A1; Wed, 13 Apr 2022 09:15:18 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neZ5o-000Gnm-A1
 for linux-riscv@lists.infradead.org; Wed, 13 Apr 2022 09:15:17 +0000
Received: by mail-wr1-x433.google.com with SMTP id t1so1675224wra.4
 for <linux-riscv@lists.infradead.org>; Wed, 13 Apr 2022 02:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vnj/mfXyw3X9KuyzrqC4TpOmshoDLe2fxPgBUJq8rEw=;
 b=OLiTP5KTzX2EMQRMyuZQT6agCOB3/2yrnTe+Ik9ZxL7u/LI4YqoTK9b+9w/hoTCHtW
 BAPtK2aVG4wxs4Uos7Q+IdMKHnf+gBRXR7sn4HgBcLEoqme+PPD4qIUFCRI2ln0Yo26L
 hEnBUOoqJesrXatPPw06xQdIliL1PCuQwZlt0N4dUDVIV7X1nPNnDMoxEt2gVPylMh9Q
 /73M9Clg+zrCQi45/Hxb2ttjKQmnockYXBgF41WzV3WtkJ7aTw7TNtNVndCc51+2ZWhA
 Gx6Nq/BAqvZes2RzBJJf75nM6G5itbbYDlUZ7M4nscat2VciVx3lok8ACDCjkeZM4I4Q
 oGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vnj/mfXyw3X9KuyzrqC4TpOmshoDLe2fxPgBUJq8rEw=;
 b=w+NvojJDIj+ypRdSOfyaWOtZB5fDf5C2iLSv2u+o8ZWXoU8trwGcHDwEs/X9sMH7ju
 LYPzIDxRmz2z5vAZUf1tpWTglUzKLC3n8K0kXUN0zkJxj3eOKE1cFkOxxNW6S6t5Zpp8
 CaVFwbeRgXIaxXj7y+BKeyXcbbRJrUZYv37cRt4sDiMgzlz97ZRrWvOnseoYxcDYlLKe
 uJ6cdLfdePlB6zdeVHNkOGSmobEe8A846fskhpMKzE5UePDywxLPl0n1Sn8UIrYGLFg+
 2Xgail2TZFizmPSc9qUoIvf7ePCOWmV4Gzv7c/vOkbq8WfIm8X+12WqK1u2jSjK2bAz0
 Y4pA==
X-Gm-Message-State: AOAM533GBcKkXtEt4t9LiQ9ZVRj5Lrc/CNv/Axo0HkVwPicOtYSOyBBu
 No1KsCQka5SjPXplHUGXQMTH1gQA7jJBO2LIJXZdcQ==
X-Google-Smtp-Source: ABdhPJx8DruPa2vSEAy/3SFqU1sX90/qigxx5j4L1ib/z1Wj8i0Vy+rDVHfazCrISW9FG0MytXPj0Ml4Q7klFXyK9gU=
X-Received: by 2002:adf:de81:0:b0:207:a65c:d895 with SMTP id
 w1-20020adfde81000000b00207a65cd895mr11371461wrl.647.1649841314677; Wed, 13
 Apr 2022 02:15:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220413030307.133807-1-heiko@sntech.de>
 <20220413030307.133807-8-heiko@sntech.de>
In-Reply-To: <20220413030307.133807-8-heiko@sntech.de>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Wed, 13 Apr 2022 11:15:03 +0200
Message-ID: <CAAeLtUA2icAJSUD-cc8+xnx7Vmmd3ehn2ieB4_DuzOu2_dFvrA@mail.gmail.com>
Subject: Re: [PATCH v9 07/12] riscv: move boot alternatives to after fill_hwcap
To: Heiko Stuebner <heiko@sntech.de>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 wefu@redhat.com, liush@allwinnertech.com, guoren@kernel.org, 
 atishp@atishpatra.org, anup@brainfault.org, drew@beagleboard.org, hch@lst.de, 
 arnd@arndb.de, wens@csie.org, maxime@cerno.tech, gfavor@ventanamicro.com, 
 andrea.mondelli@huawei.com, behrensj@mit.edu, xinhaoqu@huawei.com, 
 mick@ics.forth.gr, allen.baum@esperantotech.com, jscheid@ventanamicro.com, 
 rtrauben@gmail.com, samuel@sholland.org, cmuellner@linux.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_021516_380971_F17908F9 
X-CRM114-Status: UNSURE (   8.29  )
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

On Wed, 13 Apr 2022 at 05:03, Heiko Stuebner <heiko@sntech.de> wrote:
>
> Move the application of boot alternatives to after the hw-capabilities
> are populated. This allows to check for available extensions when
> determining which alternatives to apply and also makes it actually
> work if CONFIG_SMP is disabled for whatever reason.
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
