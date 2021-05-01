Return-Path: <SRS0=1eEn=J4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3BF1C433B4
	for <linux-riscv@archiver.kernel.org>; Sat,  1 May 2021 15:53:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1701E61574
	for <linux-riscv@archiver.kernel.org>; Sat,  1 May 2021 15:53:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1701E61574
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4MSspI9uAhovcMoQTQsD0oYOkI1et5eiHBSCrPE2XAQ=; b=BV8Lw8tO7NMxWE50P+wKvkcj/
	Q8tfOUvDuDwDBiWi2MNqxr+jQ8rbst4EdSY1Yo1BeL3JH3toO5Wlkck9BcR5KDypMQiaOUTP3d7n3
	QSuyTab+4RZe6nNqCs0QnjXf3v+6Q0v9aNAXljZIEgPM9a1UVvGMhxfiwARpPL5zIdLRHfUSBYIzO
	aWRJm5FN0TXFdOTgx2hoLVP40mJZzBo0cq3Eal/DOXVsWbR9eBPQoQIr7jPodvvaBG/o/oAdPBrfB
	rdY5Ukt0RpwGrK13iV0JZssrda3kbPjyJRfqdPIaKcff+keHzASd/Qfpp9+8NTzjirNkTfqtCXRA0
	FjzifSHIQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcrvG-00AIy0-Qx; Sat, 01 May 2021 15:52:50 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcrv3-00AIwg-6M; Sat, 01 May 2021 15:52:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=JjYGMVIHK5n7yoxDPMXd66Acol9hZKelHx5UT6nH47Y=; b=4RinhYunE+erSWNngm23GmWMGt
 CLCSXnJLeJaSTJOMQtIEO0nQlOaEXWxqnhoUGQ6qVKeFFExSxU+tXtXwIZ6M+iKmV5d+Iv1OWNJR4
 +T/Nu7xD9PwdgLRRDXqZm5jEmp8rWCIZNSKJ9EWsZ8+yrAkvxC0H5OiZkMXuP1bjKFfoBY8RjrBHM
 nf3aQlMHu0nKeyxOF073IJF4R1SyHtyVpci3Zy2fXDI/q9RjaC6Yl3u8wTwWWPyBiHGjViqiIHQHE
 Wo5U+YfDc7lh9n3+w0jarXldzTJft6tfsuDvUSMac0wub6SETGUs3JvMAWI3NHDVLa9shzbL9iDTq
 gFbFMT/w==;
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcrv0-00236f-HY; Sat, 01 May 2021 15:52:35 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 15so1943018ybc.0;
 Sat, 01 May 2021 08:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JjYGMVIHK5n7yoxDPMXd66Acol9hZKelHx5UT6nH47Y=;
 b=blRUIoJdCmVMNiQDMHNaVJve98qPVFj9/24WjJdA429iQkxxVreNispe+BqiBA3d8W
 Acr7BVauP7zkcs15L+68w5EqDvJuqgqAQiUpqTLpjFrGI4w60FlbBjkAovszT+DhAO2Y
 tHmFz//OpI0cdY7Ho2lJ17ud/C/jzzNtemRy5ooBS5sildh6tdH/JXdOSWzcu0kUHuRk
 sWuz3sEcBwnrjw3SmYkDYCFW6/LI+qbeU5bNDNEyCV8lhk15528w6zCTI7qv8GD3C2Qr
 /6S1azORvcFztQ4nBtiPy2tzzOKKF9suofex4xX1vd9C6oVASMofpqqBqVOFa9w2DOS8
 wBsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JjYGMVIHK5n7yoxDPMXd66Acol9hZKelHx5UT6nH47Y=;
 b=VLY5U47ljuB0fklemTsBBn5MeY2KcdB2jL/sxLEc3yCN0j8In4uA8mbyG9MV4Aov6H
 U1YaJ4qCi7Mvw+yL7NpgIfCxLw1r7xUXginraUSjC32QBN7728ZBE8KapC7VASqR0cLg
 m4J9QJ1R1LI/uTrOU78LIK69PdRHL6IoExZiGkphqbHQxymjJBDAWySR1gRsKrp4DOzy
 jqlmmUrDwZmPnH1pgCu551bgcW7TFxjgegx6f7FyZRYGb50qsojtr9P92Lh2RXBaL613
 ROnZzH8g9pvoKPG3Dem46xMwqOX2yYNb0D93iweJkPOXL6U4NYLWnZ3zW2f+n7Bnr5AQ
 dwXA==
X-Gm-Message-State: AOAM530Bkf+KmJevZRqjpotXPj9mLzpLG2hUC2jsxxiHb/phr9qLG7r/
 RwfDQJzga+HeuDd4bke5qRDlHLjGKN4uKHMr++E=
X-Google-Smtp-Source: ABdhPJwv4Dai1oxa4I+vtOog2Hw6tEyYe4CX42qPfvaPtHahj/3ak3VQm5m0KU7mUuftqlcL6+PQQToSr4CzLa32hoM=
X-Received: by 2002:a25:c444:: with SMTP id u65mr14862039ybf.93.1619884352129; 
 Sat, 01 May 2021 08:52:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210501151538.145449-1-masahiroy@kernel.org>
In-Reply-To: <20210501151538.145449-1-masahiroy@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 1 May 2021 17:52:21 +0200
Message-ID: <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, 
 Linus Torvalds <torvalds@linux-foundation.org>, 
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Will Deacon <will@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Albert Ou <aou@eecs.berkeley.edu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Jonathan Corbet <corbet@lwn.net>, Michael Ellerman <mpe@ellerman.id.au>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210501_085234_599248_25B50CCF 
X-CRM114-Status: UNSURE (   9.62  )
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

On Sat, May 1, 2021 at 5:17 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> More cleanups will be possible as follow-up patches, but this one must
> be agreed and applied to the mainline first.

+1 This will allow me to remove the __has_attribute hack in
include/linux/compiler_attributes.h.

Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
