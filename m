Return-Path: <SRS0=HQWJ=IG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05184C433E6
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Mar 2021 08:32:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E2DB65139
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Mar 2021 08:32:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E2DB65139
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=z1bQJtMmSTqENP27cYVEQUMWIfUDhxfKk1EY8GMPP5o=; b=ON6WuktAnXWZbgYbz7Sp2swiu
	rCzFOIr6MH2bKYWy4OXos4IID8RpnQgcsQhmNWPVU0Bw1i8CfF9zFtx3SDjRQKHaiTgRw/WVYByug
	+Q+3VqayNk6vUDl53XxqmuIJLuzSydeX736uTIB+j85ZgX09idAHQuAdSDt3k3/pwASxvOLfqgev9
	MW650CceQZpljBekP6A9TsJ+lGXnWHkHfGq1FptHiJtB9W+ed5Pqwa9EWa1lD4m3s4B4DcpKMyiw1
	HMZPzwRk+h1PZjH/krBmVYsuS+mrv07IGsa3Tqz3Ha22OBP1o4lmN8F88krUj6J+Itgjs4p53JYih
	FJVCv+Tfw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJBJC-00Fwys-E3; Mon, 08 Mar 2021 08:32:10 +0000
Received: from mout.kundenserver.de ([217.72.192.75])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJBJ8-00Fwxa-H5
 for linux-riscv@lists.infradead.org; Mon, 08 Mar 2021 08:32:08 +0000
Received: from mail-yb1-f171.google.com ([209.85.219.171]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1Mn1iT-1m0Bhi0qzH-00k7so for <linux-riscv@lists.infradead.org>; Mon, 08
 Mar 2021 09:32:05 +0100
Received: by mail-yb1-f171.google.com with SMTP id p193so9316020yba.4
 for <linux-riscv@lists.infradead.org>; Mon, 08 Mar 2021 00:32:04 -0800 (PST)
X-Gm-Message-State: AOAM5335QtwlEbjKipBE6Jjbw8eD7G9m/zhlcIyouZ5WNe1Q5QRCGuRO
 ni3j9IRbXYvMuU6/DS9VpBNyXpD2zm4vLQ1xAps=
X-Google-Smtp-Source: ABdhPJz7WzRENGkqrJauNt4Eu43tE41OHtOy5Pi18b4rc5onlz+3B0QPZSg6kqLhqT6QwccMllOlz9JudYJqhcYI0w4=
X-Received: by 2002:a9d:2f24:: with SMTP id h33mr8386599otb.305.1615192013989; 
 Mon, 08 Mar 2021 00:26:53 -0800 (PST)
MIME-Version: 1.0
References: <1615185706-24342-1-git-send-email-anshuman.khandual@arm.com>
 <1615185706-24342-7-git-send-email-anshuman.khandual@arm.com>
In-Reply-To: <1615185706-24342-7-git-send-email-anshuman.khandual@arm.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 8 Mar 2021 09:26:37 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3Jp6wgGWJ9UDoiN5joOYSONaoHoH=S--i=3SQpm_f4JQ@mail.gmail.com>
Message-ID: <CAK8P3a3Jp6wgGWJ9UDoiN5joOYSONaoHoH=S--i=3SQpm_f4JQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] mm: Drop redundant HAVE_ARCH_TRANSPARENT_HUGEPAGE
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Linux-MM <linux-mm@kvack.org>, linux-s390 <linux-s390@vger.kernel.org>, 
 linux-ia64@vger.kernel.org, Parisc List <linux-parisc@vger.kernel.org>, 
 Linux-sh list <linux-sh@vger.kernel.org>, Vineet Gupta <vgupta@synopsys.com>, 
 "the arch/x86 maintainers" <x86@kernel.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-Provags-ID: V03:K1:mQidoYQM8C1ZuKum6pnT+DH+lE+hHJKXsntM9BG3fwbuU2EqlZz
 8VrV/7J5FDf/QyiKFvmNayfd2AIb4AfxJ84ViuSYf3e4tfqXctVt34O8wmWnmtLqIJjSCHB
 5zcn4/yP3BRWfWb0/jTB7bM/jwdrnPztXvHN6cjmaGn0Z2WcF1a6uEA3TrYsVAHsToRg+u8
 uAHZC89g942/Ctujx3MoQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hNk0FTrFp9c=:TsPxO4APVSNEeYjkK1jnyd
 Zab3KIIDO/1xxhMupmKy/RhwalqQXHmQ5IMOQcJrKizXBCW/6QNsJ1uSOsCbcLSHohhAqg1B1
 8o4vJ6FZNmDS7807Z27i0kPCE+bSuDjStg9p3yc9eoUqnxtFZRT1CK4NDyX6k/4YSJn1z5gh3
 mcSbWMmsXFyWTO+bfsZYLwjoz790fCpFOlT8G9Ewru/19PmU1GCpcZt5UCxZID8QEGYRCnWWr
 MgO9xtwVrQJhOCG82cH2Ng+WhSHt8Eac55vrlhrItC2i8dSB/PKpGT1bHG150JX2bIiQ5/ZBo
 cvkTb6jZukzPGhZwVitlVFFT62Gw3Yk0l2dru0IBM7qV4MxKnqmOZp3cWziz5sxpLap4/gyS1
 TGOS0mnqax00ehZBKcSbooww82loNAK8BIn693gyN1mlowaXgR3zlgVtABXHnpIeMYqJS99No
 GTJ5BWFvBlbLxyC0ttRpanj+qHuiJuQG8gNiPK7knVkZNPPQD3s6cJaqvEMEk8Wsjhi7NPS3M
 1ecvEQmpXSedococEZ+s5ZguwBOreAt6e6dIw7qGtZLtTQ9XjjQAsZ4xMV/MWuwZw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_083206_715412_C1840EE7 
X-CRM114-Status: UNSURE (   9.80  )
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

On Mon, Mar 8, 2021 at 7:41 AM Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
> HAVE_ARCH_TRANSPARENT_HUGEPAGE has duplicate definitions on platforms that
> subscribe it. Drop these reduntant definitions and instead just select it
> on applicable platforms.
>
> Cc: Vineet Gupta <vgupta@synopsys.com>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: linux-snps-arc@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
