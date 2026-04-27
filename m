Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B91FFF8867
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Apr 2026 21:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4RqjPhA2svU9gWGhCeFM5iLGqoFPhQRm4YYxK7VfhZg=; b=ZM2B8D1KxD6E3W
	F83c3kiZ9nidV5f+p3lvmTWPsOEjetORhYrojauHzMbVtWzaU65yAqrhG9XPR7ZVtC2MBnnt2JzCN
	9ciyJzDrImeex5patr8H15+MR8lXi6oyOjPQ9bMNZsuRFwpyfEPYmfVzlzwnuSb6NfYQAPk8bSBS6
	ZKiV9YYIZSbLfBlaEw1xTGQbmnNmTUKa3/yjXzSOcQECZ+BX0t4ZXUD27IxYzOMxENFeBzhNOwsRR
	CN7jtZGQnirDrWrZZF8sQPoTpLlGbaqMcEHK4s1Qz52T+hcKAnMD0RZPoJxFTeAIYA7uACpR/eQz5
	vQUmo9a5FRLihZ98UYVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHTmg-00000000CAy-3vsS;
	Mon, 27 Apr 2026 21:46:30 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHTme-00000000CAT-0UZv
	for linux-riscv@lists.infradead.org;
	Mon, 27 Apr 2026 21:46:29 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-bb3c4d8cc29so236916166b.1
        for <linux-riscv@lists.infradead.org>; Mon, 27 Apr 2026 14:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1777326386; x=1777931186; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DjF1Jdn4Kp6xFyaBmAP2391GfFF2q7kuOVlruTChM90=;
        b=Oq+OSXBeIEaLP1vpjnrluXGbAJZ5Yc58q9d+8I35M6Pq81nPSk4O8fqeT/Jz6dTjUc
         N9EawXyCancfOz1PValYQb5Ghf8B7pt9LMjDrY5LvJgUfcTv6bgD1K5qhv+5siQGZ0O7
         0WtFbdAm5O9h4vP1RagVdKdyDeuE8qUyMKLjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777326386; x=1777931186;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DjF1Jdn4Kp6xFyaBmAP2391GfFF2q7kuOVlruTChM90=;
        b=hIJ9vDJom6p0akrCVaRVDCsUoQi6lauEhukT+KGCWdtOYSz44sGFkIomZfs3CXjDma
         0aWe8bBwLXqy38mNgM8i/+Qud7GV8O6ZF7/ttkqYlBracKj+g5w/cwoznXLTAmLEmCPj
         /QuxWnqG8FnVNwTcaKSJgJlpyVgY059IntZsxC29utUW1pnvx4p85qYn7g6qRL06hqZp
         oykw/TFoOfhj5w1r9rpibIq9JJYnPShMWn2oX9mOB6KjmUUcLIHMFwzzmIKPplae0CfH
         ioNY8AaO2OBGyq9U7e6kd0bWJxCO8QWMWfS0dhHoxqZ1biW3nr2eaSKedcpqncjILvaB
         kJeA==
X-Forwarded-Encrypted: i=1; AFNElJ+Ch5qm4awL4Y/6/BrMwvYSIUOuzOZiDfteUbUFMBj1J97w0jc997i3UVAM/YYaHtrTh+72WCfqIY3rig==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4FUkAK274ICygiB0xb/GwL3+XFTkiIDO70gZ/+Mkys74mxOgQ
	Hc6xxt3OqXDt7GRsL5s3a3/qct6e25ZOJyvMPIvk+bkytC9XxMFg1EZVoaBmA5qP5RGdYWj07i3
	hYZRFm/VoWw==
X-Gm-Gg: AeBDievmFCUqf5VsEZdTnzFkqH5LrnKrxoSlxvfHCZyxu1tXYlPkxdXXoU+LsDfoOga
	/Bmbu6EBnmGh3zC8G7p6xmrvhgeEN89aGJiQZESojvIy8AH36MbyZRgFjbGlChCJlM5p4VqFL2V
	81TmImQFRg/uWrWRF5sHGKXduN9ub7RHRv0Gs2RGPEQ1GKTUmm3qN7kjsCgZ/CKGJLmDdxKzInS
	Bb5NTqqqUtH4X2SpkHi6rL0dmvg4u4ULbh4+rV5kUkUgUUIeuNE4cp6Tgp+gqMGOuDVQRv5ktta
	qG1WaHCLc38sbJgJYWYUt6sWpZvy0zJGSZw9SuhGtsKinxOSP34wCF9CmWp25j6pfWno8uKJzqO
	2XEC2LnYNmwo9er0OLj4p2IsLvgf71pFEVKfq7QMFTKljhhyeUkgvtD3semwiKngpTzka9yLu/p
	BuMRgF6ROsAggMRrNgPnaPBPnd2K/WbNrEREsCL5tAOhyYipzLoRWqGCRrn8b3ED6jqPSkGcf3v
	A7d8Uo5ZmKxH1WqjZjOGw==
X-Received: by 2002:a17:906:ef05:b0:bad:8491:85f3 with SMTP id a640c23a62f3a-bb804c32754mr23802766b.34.1777326386053;
        Mon, 27 Apr 2026 14:46:26 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80b2aded9sm9427366b.41.2026.04.27.14.46.25
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 14:46:25 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-65c4152313fso14723657a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 27 Apr 2026 14:46:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9fH99X/yzwHvt6Ztfhh8U0aFIjZVM6MEQqUp6B0cKZd2R82K4BhzAMs18N8suGTEqYxtoVSoeOvxsIEA==@lists.infradead.org
X-Received: by 2002:a05:6402:5216:b0:679:1f4f:9d30 with SMTP id
 4fb4d7f45d1cf-679bb04c1a2mr179970a12.4.1777325976937; Mon, 27 Apr 2026
 14:39:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1777306795.git.chleroy@kernel.org> <289b424e243ba2c4139ea04009cf8b9c448a87ff.1777306795.git.chleroy@kernel.org>
 <CAHk-=whC1DZojwdMB1=sJWG2=dsCdfyU8N6tDE1qx50HRZ-WJQ@mail.gmail.com> <20260427222914.1cb2dd3b@pumpkin>
In-Reply-To: <20260427222914.1cb2dd3b@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 27 Apr 2026 14:39:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg0SGbRYhdZ1kvJUTv1HEvmRJyQauFtBGV_fMcZVF8UpQ@mail.gmail.com>
X-Gm-Features: AVHnY4I-AxqvQRk42MegvhKMp_z4sSEpEzhzpgw2GyV2bV8dezSPoI0JTlwB18Y
Message-ID: <CAHk-=wg0SGbRYhdZ1kvJUTv1HEvmRJyQauFtBGV_fMcZVF8UpQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 5/9] uaccess: Switch to copy_{to/from}_user_partial()
 when relevant
To: David Laight <david.laight.linux@gmail.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Yury Norov <ynorov@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, dmaengine@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-fsi@lists.ozlabs.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org, linux-wpan@vger.kernel.org, 
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-serial@vger.kernel.org, 
	linux-usb@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-fsdevel@vger.kernel.org, ocfs2-devel@lists.linux.dev, 
	bpf@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	linux-x25@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_144628_169131_A8D1F406 
X-CRM114-Status: UNSURE (   7.97  )
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

On Mon, 27 Apr 2026 at 14:29, David Laight <david.laight.linux@gmail.com> wrote:
>
> I think there is a slight difference in that the normal copy_to_user()
> will determine the exact offset of the error by retrying with byte copies.

I have this dim memory that we decided that you can't reply on byte
exactness anyway, because not all architectures gave that guarantee
for the user copies.

But that thing came up many years ago, I might mis-remember.

            Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
