Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A7FCCD184
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 02:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hc2DcJvDCn8B5/KzOD6EcxtnJjBw4Vlo4wH4BdtuEyQ=; b=ORHojipOuJqUBM
	c2BYtXQaNQYk0uPDsIkAPuLA2F5XLx+jWsa/p1RLQtq333Tp0smiwLjfocVgDaxuxxZzVjStAKv0j
	LYc00VMD2tiSGOSDQHSNq3/IseNenumCMKTJZVLvDsEPIlm5h68gEwoQUGkOToNPfBt0dy3KJ91Ld
	y6tMcaQmozFd9Q3PijLDf9BY9Pk4XQCZ/Njvw3G63gY72K8MGK5hCoyB0oFbtQ0juwU3ZlxuuocP3
	LONocrmCiDkGqOiR6lwqnfVjjZ+WRshrCGlGH42Bayl1pdWOMl3/9e2iGkpi1vpkfrpQyhLrJAT0Z
	chV1r/kmQBua0Ldje3NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v73BV-00000007WY8-3jvG;
	Fri, 10 Oct 2025 02:48:45 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v73BT-00000007WWq-39iF
	for linux-riscv@lists.infradead.org;
	Fri, 10 Oct 2025 02:48:45 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-74435335177so41239467b3.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 Oct 2025 19:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760064523; x=1760669323; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SUvjTYrAKggs3w1tKlxCJydt04WX0hyij5ZVnNtO2rY=;
        b=nn70f5QF3gnIFo96OLfM9AXsi306gRPjkR5MQ1WgRwMxQhlGQ4uTK0OMQgXQ5NuF1T
         TEKTfv56Ew9qDwVKro9r4NzdlRy4umYWPKZb6iUpmajuxe3CfDE5xqPxL0PkBbDroIOh
         i1gucFxOywYyh65NprHvcEXRXUqZjy9c10CjXMgYm4wLMOND7Hy9xB4fmke6C253Qbxv
         DORAI+SzQ4kT2yBLhUKff8wA+AvB4xaVfiWb9Tz3EA1Cn0R8ov4Cfd6f2GHEYiu9X7zQ
         +ocsJ7vcJQcXW82XrbnEHuWF5jU3tgQgH5MfUMqeb//eWalvzdN4eaCmkJzfOtHPEXdl
         QeQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760064523; x=1760669323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SUvjTYrAKggs3w1tKlxCJydt04WX0hyij5ZVnNtO2rY=;
        b=q7JoUoJTPRvj/47WsGimrSC4umtsGWtsf6qU3XXuyjPZWD4YqCdjgfOwGXNFSUObVL
         hSd7wS3I8D5y+mWfzIoBYvFx+VhFxaPksye92dh/UiTNbEkEzbBZCKYkbcbGvOqDZeOz
         1PRGVGSBjtcT52VFrxmcEUka6iyBwNpsMW58yBYX8UYOfyTW3Pb88J3WvpP2NAg3CwJT
         ZcVeXfxVE5vGt+UNnzYo5UtnIxU60uiXt3rg4sJpyd3VUTveBVSJgZ0QWSq38qRr8S4k
         hJutVbyUcNvAt0qwMkHrrV+L1CgblpYS6/RvY/WuHqISfVMT78MXvUjNCnGdhaHVfySD
         eGwA==
X-Forwarded-Encrypted: i=1; AJvYcCX8jg5CgmNwefdhNlv+K09VKAMqbWZm/wN7jdsP5kU8KrmiDzX/Ap58TDDeCU/8NsQCvI9/sqrOrUD9Fg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwYUG4z0fu9lluOnhsblB0R+qkm0uJu1QiP08avadoIr44eZdaJ
	3G1Z+5A45I4PAXsBawlH12Pp1jWWLxWPF5jnSH1Xp3L8/H7sezji55pR01hUZEP8fpvqOhXyoMO
	g+r+PHVTCpoK9j3AR1KZqhz4YQV9Bnfk=
X-Gm-Gg: ASbGncsh4UAP/FnO4IBVSOisKn2sCDMNtmo/8PiYtbEavN+KWXfEbtQkjKwtaZnSymQ
	Mgy9C+u9tFnV4YruEo2f8UTEkNVcDhgsKghFyn5DQqr5XIT0cpQP4yvBJ57hPW0O64FWkUH3LvN
	eLTzKTIoc2BUfKRrMoWuBFlhbGJLC3nuA+OAGTlMuHwbnNk7AQmupxWQoE1n4Rg/BBW1x6pJ9HV
	Zv4p9e8MzsOiFC3qbg9kPOTWBVdrdAHbgF0hjImzw==
X-Google-Smtp-Source: AGHT+IE/ruZR0Nl+gZjd7KSfaZ+4Yt5azf8Eoz6teA2EZ5XcCIQ6BBXF8AxOCZshaSTrV+l7WDzDAJYCcqNIJ+IMELc=
X-Received: by 2002:a53:cd0e:0:b0:635:4ed0:571e with SMTP id
 956f58d0204a3-63ccc4fd4b5mr7697871d50.22.1760064522649; Thu, 09 Oct 2025
 19:48:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250913003842.41944-1-safinaskar@gmail.com> <20250913003842.41944-22-safinaskar@gmail.com>
 <a079375f-38c2-4f38-b2be-57737084fde8@kernel.org>
In-Reply-To: <a079375f-38c2-4f38-b2be-57737084fde8@kernel.org>
From: Askar Safin <safinaskar@gmail.com>
Date: Fri, 10 Oct 2025 05:48:06 +0300
X-Gm-Features: AS18NWC-iakvkxLfUlO1LRxakg0fg4KV7Trw_hsIF2wxGpnmpWZvHTCQ7Z3GaoE
Message-ID: <CAPnZJGDK08eDWaMTmvVQwkAAThUvgB0XgAapqqV4_ZmWeay-iw@mail.gmail.com>
Subject: Re: [PATCH RESEND 21/62] init: remove all mentions of root=/dev/ram*
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christian Brauner <brauner@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>, 
	Jens Axboe <axboe@kernel.dk>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Aleksa Sarai <cyphar@cyphar.com>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Julian Stecklina <julian.stecklina@cyberus-technology.de>, 
	Gao Xiang <hsiangkao@linux.alibaba.com>, Art Nikpal <email2tema@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Eric Curtin <ecurtin@redhat.com>, 
	Alexander Graf <graf@amazon.com>, Rob Landley <rob@landley.net>, 
	Lennart Poettering <mzxreary@0pointer.de>, linux-arch@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, x86@kernel.org, 
	Ingo Molnar <mingo@redhat.com>, linux-block@vger.kernel.org, initramfs@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-ext4@vger.kernel.org, 
	"Theodore Y . Ts'o" <tytso@mit.edu>, linux-acpi@vger.kernel.org, Michal Simek <monstr@monstr.eu>, 
	devicetree@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>, 
	Thorsten Blum <thorsten.blum@linux.dev>, Heiko Carstens <hca@linux.ibm.com>, patches@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_194843_798616_D4FD34A6 
X-CRM114-Status: UNSURE (   8.48  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU3VuLCBTZXAgMTQsIDIwMjUgYXQgMTowNuKAr1BNIEtyenlzenRvZiBLb3psb3dza2kgPGty
emtAa2VybmVsLm9yZz4gd3JvdGU6Cj4gUGxlYXNlIHdyYXAgY29tbWl0IG1lc3NhZ2UgYWNjb3Jk
aW5nIHRvIExpbnV4IGNvZGluZyBzdHlsZSAvIHN1Ym1pc3Npb24KSSB3aWxsIGRvIHRoaXMgZm9y
IHYyCgo+IFRvIG1lIHlvdXIgcGF0Y2hzZXQgaXMgd2F5IHRvbyBiaWcgYm9tYiwgdG9vIGRpZmZp
Y3VsdCB0byByZXZpZXcuIFlvdQp2MiB3aWxsIGJlIHNtYWxsLgoKLS0KQXNrYXIgU2FmaW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
