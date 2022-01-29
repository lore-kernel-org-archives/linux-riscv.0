Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A30EC433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Jan 2022 21:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hvhxgqf+ChTdGBX4yKm42jWio2ouWtIEfNf368mfMu0=; b=Wexz91lpRZM4EC
	Qpqgu5kQz8Gs0/TYHYHbePo44B32tTPh7T/4S8HTuzEj+6uuplmVBPb/+jX9h3scj7rUHQOmxwK49
	4E3NbCapToqmouItJYyYf9g7OpooEl0WZtJfNJJNyjbibL32oNK9xCUflAzY3JPsn7y2Q1/JkHZJi
	x3SNJiKFcSixSSrbuw7Sqb5LJTdjlHafSK0mVKOQPEqy1G6LwPPlSi5uDmMuXucCalOiYVrQlH+TL
	TD4ITPwRN1K/33S1IC54khKhxI4NOH+d9H/KL1Q9VF4zW5L8BaTTxD2UxwED3E/bO2cnhBo5Sl27v
	EYSQcjMR1uJFQtoWyKAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDviC-005SzK-C0; Sat, 29 Jan 2022 21:56:48 +0000
Received: from mout.kundenserver.de ([212.227.126.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDvi9-005Sxk-7i; Sat, 29 Jan 2022 21:56:46 +0000
Received: from mail-wr1-f42.google.com ([209.85.221.42]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MQvH5-1mrAKL3bip-00NxqP; Sat, 29 Jan 2022 22:56:42 +0100
Received: by mail-wr1-f42.google.com with SMTP id s9so17784272wrb.6;
 Sat, 29 Jan 2022 13:56:42 -0800 (PST)
X-Gm-Message-State: AOAM532tdO6F3MI/GM2nOp7YmWxXDaELAvFkd7YQ59Wce0mZjNOTXNjT
 S3smjMokxVJX3Yotch8bJum3B1O1MnoC7nkUWio=
X-Google-Smtp-Source: ABdhPJwc5Xijmfuq1knxS/SFbXOQYffcGfosuG5ZO2lbKDIA+jheKOcNNo8uA5Z4TCV2skF+ogyeNdBrzcg4f0zq/zU=
X-Received: by 2002:a05:6000:144f:: with SMTP id
 v15mr12082870wrx.407.1643493402481; 
 Sat, 29 Jan 2022 13:56:42 -0800 (PST)
MIME-Version: 1.0
References: <20220129121728.1079364-1-guoren@kernel.org>
 <20220129121728.1079364-7-guoren@kernel.org>
In-Reply-To: <20220129121728.1079364-7-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 29 Jan 2022 22:56:25 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3_kVB78-26sxdsEjb3MMcco6U55tc7siCBFZbJjyH6Sw@mail.gmail.com>
Message-ID: <CAK8P3a3_kVB78-26sxdsEjb3MMcco6U55tc7siCBFZbJjyH6Sw@mail.gmail.com>
Subject: Re: [PATCH V4 06/17] riscv: compat: Add basic compat date type
 implementation
To: Guo Ren <guoren@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
 Anup Patel <anup@brainfault.org>, 
 gregkh <gregkh@linuxfoundation.org>, liush <liush@allwinnertech.com>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>, 
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, Christoph Hellwig <hch@lst.de>, 
 Christoph Hellwig <hch@infradead.org>, linux-arch <linux-arch@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 linux-s390 <linux-s390@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Parisc List <linux-parisc@vger.kernel.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "the arch/x86 maintainers" <x86@kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-Provags-ID: V03:K1:6ZodAR5utVoKlvJWdyXuMsuqjtbI6AG1nR+Au3/GetzQ1uMscoA
 9Cg8z+vpV43MvJdrJG0Epwxtn7oOb9gG0/PuIbf9JdFFv087hRG2UWdMyNTivIohcas1DN+
 ciEzft6nUprg1SJgHD2cDuRSMcvcU8Nw+jfmOJoy9wTt9D9voOjunYdVVy/Qaj1W93WlW23
 9EtaM1XWOi6WxZN8QU8Jg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TX6B3Koph7Q=:/WZ/srtPr35GYulWv1sKpp
 fmzinMLCHgWWHcc2HRpbEBVQ/CWMH5hNxvnj0Miy8HxyFr9OWP1UAoTNlkYMf6gUBzSfCNsew
 O/N1SFLaui1pfGlMooQJoxU81N1sB7Bfb/HsmVQoeCl/c9EL2LVlhopZibid1caao1CZejlZM
 3mUPYHegh5ZYqJ0iwwHVERDcQ3cp5cQav2E3EHwf4hE5UUd3EXUzLubrGAz6hgngZVtqODm4x
 o86unX0/WcpNgf4W99EH0sq5hgigYyh7drf5MZIaryeBONADVeoHbDVlUKCkqQuVtZ4Mv1lyA
 QIvJKnq16NZH4biVs2bZd8RcOB3rexLngmKszGDwBBdFOpxBw9vUUEFbWcW89k1CA4nlIWeJI
 WFq3gfHpdyrTIjDgxA1Zxx9iXMvg4jpWze3iBhGme+H+lbl1eT705S/C68bySahfedIrFxPc+
 AnfO4ChmcDfrjaBWV/+Thi8PYqvf+5gcWZ+ejBOFtpHCLTt8AAthz86fM5dePRB4sKIcsCDZo
 JISDt2cKBb2vdZjBnmj7o9fygB+e2ct2yvSA3eAaZXyQyJh0jyk+neGHYeGS/G7cGpa1WhG1g
 pjz7o0UPlcPtGfb7dU1XcAyoNKRxI6tmBirqPx5tFew5CWOjssvLZ0GqJpASbXmB9XB0sGjkD
 /nGjr8RjVxNamVTjirk87p41aVu7mFytNF000SUtBU78kA0Xiubsh9Uq0OB+ORRDHHRlfgyYg
 V9k7QJ2IrZ0OwRsQU4a5zeRAHwoNNtt6h5cVTI/CKmi1eCaTKde69LwdRyD4AyrZCAnvJKkFj
 LjnuXGJvK0RRpl9U3qgqE69cTR3tjW6LUX7esf9VPtTqlgRap8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220129_135645_572888_BF352803 
X-CRM114-Status: GOOD (  10.07  )
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

On Sat, Jan 29, 2022 at 1:17 PM <guoren@kernel.org> wrote:
> +
> +#define COMPAT_RLIM_INFINITY   0x7fffffff
>
> +#define F_GETLK64      12
> +#define F_SETLK64      13
> +#define F_SETLKW64     14

These now come from the generic definitions I think. The flock definitions
are just the normal ones, and AFAICT the RLIM_INIFINITY definition here
is actually wrong and should be the default 0xffffffffu to match the
native (~0UL) definition.

            Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
