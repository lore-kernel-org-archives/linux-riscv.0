Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1945C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Apr 2022 09:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LxxbX1/Yf4iDi+h81N+dx5eKxexV9Y+lJWfhtY81vrw=; b=Z/MEoKrXOtLvUh
	zdPUbIDiJ8IEkvPvUGR6fG6zhM9OCEWYOCNiKM9IvNAQFaIyMjDIQjMnCLY2e9TMBKixOOFVwwzXD
	7dcHPk/iKsCf91yELVcmYwlnQMIa1awEwKK0TmFsifOAQVnaLcXMw/Bg9N8Xp1YpdY5fjKYZPKe3J
	IlATmTnq64w4mCQz7eSEeAE+YIsphuQVxWHv+xz4F+UBooz73muS+qm/PmTxRYcv4DFMXdqtpqU++
	kig/0s+vzTTtNy6q2bQUn7AE39VgOXiMU3Sttf10rE3QTAVv1ScmXid8exf4NGDOet8BLCxDdxcLd
	5CrLFeS9oF5GgKAxbDyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neYzG-000EOQ-FD; Wed, 13 Apr 2022 09:08:30 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neYzC-000ELd-8c
 for linux-riscv@lists.infradead.org; Wed, 13 Apr 2022 09:08:28 +0000
Received: by mail-wm1-x32f.google.com with SMTP id
 v64-20020a1cac43000000b0038cfd1b3a6dso3484309wme.5
 for <linux-riscv@lists.infradead.org>; Wed, 13 Apr 2022 02:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dcONJnYI4hzfAnWFiwecQemmmPoFQyWC52bLjUUOhrU=;
 b=C2A0UxLCik2RA66J4ZxU8ctZ/aw4YcYRTXGVm9HyDjtOWT0Bn25s55zjbACnN6vpTY
 Y6sLVRjED/jhSIQrh0rna36qT3pmCF//OnTMjDlataZMQIcCuUZ1quxEX5jwdsNdOQ/j
 Z09rc92UYJIp9JUy/q1S92YX33AaWq0n6pK7yV+6tcDOUgviPs3bd2kyg+5x2K5PBiTP
 fl3qaJ9GioVeJRagF2rNIPp3EB6J05yTAlrsyRZesIGLsrIQSlYhKAul7767YybQ0C50
 YDZ+bd4nErjZTXNmqTic4M1kdTgdLHbDtUgNIY2etG8k13d/z2U+B7rVXeoAvweW1DJI
 CkxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dcONJnYI4hzfAnWFiwecQemmmPoFQyWC52bLjUUOhrU=;
 b=B1COwgnKBT4QANUY/78k84ZXjkELMd+VURa4Xva0LFtR9AVDYZO3VpSArtYwob3Dbx
 NU68hqWpuhNE12m0a4sc1d0r9BFXYp7GAJ9JDEUjVZchWIKQBj0xuZaGCjGqhXrmDnrW
 BhsIeK42MDmSzw562QkL4YowMYUhq09wl9jKNNXKQu9CS5aKTHQgIPQ/Z113M15SoNRh
 tY6cmYzmq7csoYDMm0JyUaIIXQkEpgqfDpqeJ7xd3AqvH8rcSPbbK0UbB+jIuDgOSKLx
 FEQEQvvbLpduIbOG/XZetuxDTLHBdNBDJT27Qj1wJ5JKD+DJdnTW+jXgqq28Jizfty+J
 BwEA==
X-Gm-Message-State: AOAM533zePTd2SGWvCwqB+v4tut+I7YfmV4UvTA6g/pio+ulsSsIrtSC
 Z2wHyarmXf1oOg8E3So4Ap2bi0rtIaIHidg4aHiDig==
X-Google-Smtp-Source: ABdhPJzSxXBk+5mekTAuDVmri1mQi8I7f+bYDh99NHFWD3CXOjiXY2xxY5gTJfwTdzd9TpeYBmUYvQ3dF4xNbswSc0E=
X-Received: by 2002:a7b:c20e:0:b0:38e:b9d6:211b with SMTP id
 x14-20020a7bc20e000000b0038eb9d6211bmr7934373wmi.188.1649840902444; Wed, 13
 Apr 2022 02:08:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220413030307.133807-1-heiko@sntech.de>
 <20220413030307.133807-5-heiko@sntech.de>
In-Reply-To: <20220413030307.133807-5-heiko@sntech.de>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Wed, 13 Apr 2022 11:08:11 +0200
Message-ID: <CAAeLtUCK8eow4rFmWRUVHhQjpZzhiXrR+49sS6-FjtoHpafR+A@mail.gmail.com>
Subject: Re: [PATCH v9 04/12] riscv: implement ALTERNATIVE_2 macro
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
X-CRM114-CacheID: sfid-20220413_020826_365170_E9E2D8B3 
X-CRM114-Status: UNSURE (   7.93  )
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
> When the alternatives were added the commit already provided a template
> on how to implement 2 different alternatives for one piece of code.
>
> Make this usable.
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Reviewed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
