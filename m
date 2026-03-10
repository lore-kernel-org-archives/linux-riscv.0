Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A612EA8550
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2026 09:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ej58Vk/M3x7V1Ycb8XM+978rGJooLMHQ5JadZQInUyY=; b=eIc2JN+aj+Aeg+
	jv2umH1ZwBZJu+wXfYXuGtZ1yjSx6RSvfpcul6beR6QsDue61SMrYbb7JAc93ZbMgw9ghFHkAL/8r
	YSQ1ayXiMa35Tz5Nshv5/2woknUIp774uGHXsbkzziVQTQQWmUpUCTkKtJKIo+uNmrT/LrQLQtuNS
	1vsIMQ8Kl5N0M4o6endNKhFrYiSmcMgWqn+FkU4sdBfHo6TL4YrRceFU8hSfMkq0HArvM9pFYRYX/
	MKlm2Mj2w+sHSOwlOlKy3PX7VWpInRVuqHlL97m3RO9Rol97iysI4kp7cyQP2CworvzxfLpPfMoW+
	VexkJtYaMBTvh1HfNzyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzt1w-0000000923C-3hFj;
	Tue, 10 Mar 2026 09:05:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzt1v-0000000922a-1sIa
	for linux-riscv@bombadil.infradead.org;
	Tue, 10 Mar 2026 09:05:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=cJp8fpLboqOwYbWgHca+ngx9qjAgyToItH5dBDerWjA=; b=jAl47jEQ2hscMDYlQR96LkLlEK
	nJ1MN55iY3DwQAyxr3u95SjhUOCsOVTZ1aDugvPCAJG++wcxNChAs/f2+yWbz6htKI+oXlldBe9Th
	6r3koYuAQKEWO+29hG5A5W1RlLjuj/sPFsj/fBmztkNJ346oZSlHUnnS98O5ojm4fVDTlNJgQi7/B
	TwAgtTQPrPDGTZ8UtJ2BNbt++Pr8JH6DmedFBkURK1I2nhODgHUDwTGqOZHZl31UHoNgLskXNmhPT
	FwPl/gasIg4HnEq4P78GhhjmeFfzm4Vw1OqT7pfz+aqhro3yV5tixg5Cx2aFmNt9tlON0Fq9zq9r+
	Qu30RfPQ==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzt1p-0000000E3ZU-2X1y
	for linux-riscv@lists.infradead.org;
	Tue, 10 Mar 2026 09:05:29 +0000
Date: Tue, 10 Mar 2026 10:05:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1773133521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cJp8fpLboqOwYbWgHca+ngx9qjAgyToItH5dBDerWjA=;
	b=XWH0yPYtLOfXcf0caA0PNpcQXmbrfX6QZO0jDJYqadum05aQ/0VOajV6pZg7aYqh3+o4vN
	NCXfGKF6DTqvHJZco21JHMJs8xcnIiUd/v2Yly8ATboFyYpFvk/AqH7QM/1lnWhONNCzf0
	anIhufNnIRTdoiK6MrOmgaBXEgWYUBYTj8+0g6aCufH53TmZWMvOb3juSRCyJxi4Abqqhd
	DQ23z++Ecdo98rEZD/OG48fqoCLlkwSsuK2c0+2F1F/ttt3Y988ARHWDPbVD5I6+tXaiXa
	FZqJ7PYPCbdZTa7vHAN2crVcSKwfPqSYLK9SNQeYG6glcVbNasKJi8m43m7TvQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1773133521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cJp8fpLboqOwYbWgHca+ngx9qjAgyToItH5dBDerWjA=;
	b=i3ZS/qlkluJXf0xgTXEd+++GGB8pmbmm0D9Zca464xW2KfMRyU85RICtFuFlTX3EpqH1nB
	tO5dAxYtIfQYNXDw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Morton <akpm@linux-foundation.org>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: patch: Avoid early page_to_phys()
Message-ID: <20260310100442-53df5536-6af4-483b-bc03-74b5239caaf0@linutronix.de>
References: <20260310-riscv-sparsemem-alternatives-fix-v1-1-659d5dd257e2@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260310-riscv-sparsemem-alternatives-fix-v1-1-659d5dd257e2@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_090525_876150_4ECC85AE 
X-CRM114-Status: UNSURE (   8.81  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Mar 10, 2026 at 04:25:33PM +0800, Vivian Wang wrote:
> Similarly to commit 8d09e2d569f6 ("arm64: patching: avoid early
> page_to_phys()"), avoid using phys_to_page() for the kernel address case
> in patch_map().
> =

> Since this is called from apply_boot_alternatives() in setup_arch(), and
> commit 4267739cabb8 ("arch, mm: consolidate initialization of SPARSE
> memory model") has moved sparse_init() to after setup_arch(),
> phys_to_page() is not available there yet, and it panics on boot with
> SPARSEMEM on RV32, which does not use SPARSEMEM_VMEMMAP.
> =

> Reported-by: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>
> Closes: https://lore.kernel.org/r/20260223144108-dcace0b9-02e8-4b67-a7ce-=
f263bed36f26@linutronix.de/
> Fixes: 4267739cabb8 ("arch, mm: consolidate initialization of SPARSE memo=
ry model")
> Suggested-by: Mike Rapoport <rppt@kernel.org>
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>

Thanks!

Tested-by: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>

(...)

Thomas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
