Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B0A3C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 13 May 2022 19:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KwMADZNyPgcg2OJzYSz8jIMYbJIWOXSH7F7/HaxCAA8=; b=W7ctuvWnwYoreR
	eZKGIiAdMz8KBv+6ZJIBetFRdgqVS9ZcVetGcUXvA3HgldcgkohIVbDAySKtkS3JwaCZGXus/21ox
	VoeXJ9rtGYp5/XJnfAKQCeesRoRS8kFoHgyp8Ogxtg664efa+z+vrJeHe04KIt7+PcYTx7Hx6Ep+s
	nKa9+bmH/bNE4Hbd06vcEggY2p//oWD2P4NgAFwpiynD4cgH5MpXdzv4O4nsgoNWkYHnZTFWoRnvT
	GepTw3CTyIsUfz5v1udQ6TaxNtG8QCuR6vA2ACUrVVxBMYxwNj8xTqhDUM/Xf62LUa17dM0/2QR0m
	ndMsmac67e3Vkc3La+mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npb92-00HMLu-5S; Fri, 13 May 2022 19:40:12 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npb90-00HMKu-6r
 for linux-riscv@lists.infradead.org; Fri, 13 May 2022 19:40:11 +0000
Received: by mail-lj1-x230.google.com with SMTP id l19so11422496ljb.7
 for <linux-riscv@lists.infradead.org>; Fri, 13 May 2022 12:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jQ6m56IkNfx6TOZa4NyOX1e/UvXRK2PyXxRKo48NDaE=;
 b=lDbFjGKKBhM8Gt+fUkFJKo8DdEovRML0GVwMO6M4CIG7Z75+nYbMyZizZlmJ0lnRUP
 RzwMg6mMX9zlOVwm5aWWup+CIC6WdtUBrDkupJXkIyUWjZ3QQEiqNsWqxwqpOl5Olpt9
 4O9oRII0kbYsbKQULaH3yC3akKRKOqWhw+8hclgX6s10S4gPZq7+Rhux7JFOqGcJaffg
 AGTNHhU3n6JMeGUq6oXFUxuhwaa76C98QMnmY5Fbhf3SI9kIWng/+iMLz7DzqtvT5S9b
 AltxK9/vrTOIYtD4dhfSWF2hQc9tSl1VGRozl0EsqQsXAEcRzFWHRwDeFybxJtIFo4O2
 DGZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jQ6m56IkNfx6TOZa4NyOX1e/UvXRK2PyXxRKo48NDaE=;
 b=Fud9AAyUvsp2SNtU23T/1VZghYKpq+zOgWqIP6d3T6fd3DmdrcF+II/y9Mpg8GQ85c
 Jh0trJT4qehMZZAxmmw5TEntWniAuB0LdnJ8aOZF0l09mh5uAgpC0hiw5sgn7WcgtAbG
 NEvvUxwJNTAZoVHLJPbP7Tv1owb7a1vHGKzsyNcHofiM1uTZI0EwET2iSxt1UeyXkVBn
 LcYwDLROw4PQug2LE9chI8P114UkpPJfNnuqtk34M8+IN/Pr7pFWl85mJhOAu+av/zbd
 AopD9sEssv50Z5t9fJ/HrRpm3LH5ANso7RgN5nKaZF5hEkBJId1BF1zrJ87Gi7cezWo/
 sByw==
X-Gm-Message-State: AOAM531C4YRpRO5F15IMTN4WsOWG7fKhNhKpKbDMuY8VVBMPH1O2N6cD
 4U6F8kecQUd1CeNJKYKJE67dVZRks1Bfe0W1T485VA==
X-Google-Smtp-Source: ABdhPJzyP8gSUBuzQhXkYjjcm6QVX0cIYBMoPrTrbUmdjkIySE8ac4yxDfnc1IsHuZhajCV6mainxrW6qQKLzixG4EQ=
X-Received: by 2002:a2e:aa8e:0:b0:251:f929:3e7d with SMTP id
 bj14-20020a2eaa8e000000b00251f9293e7dmr3860576ljb.352.1652470807106; Fri, 13
 May 2022 12:40:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220510065336.hlfjrc25ajed5zj4@M910t>
 <CAKwvOd=OnJ=ZhsbX+epzbhg3sWg9yOaR=zQ4jF_Deo=B8Nx9Og@mail.gmail.com>
 <10BD31AB-C9F3-45FD-9A4A-EF7DC07C94D5@sifive.com>
 <20220512083007.gdvlaq7ar2tyarza@M910t>
 <CA+wH296d8p06E6LU4HUxcGZEf6ZkcUS_oEUY4k_zcC-Y6+-1+Q@mail.gmail.com>
 <CAL5JJjHYLTskw6YdC9qMj4KUAeY+0rO88Gh-TRaZyxCGJe+dnw@mail.gmail.com>
 <20220513034629.l662gw4mn6bi4zen@M910t>
In-Reply-To: <20220513034629.l662gw4mn6bi4zen@M910t>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 13 May 2022 12:39:55 -0700
Message-ID: <CAKwvOdnbRnEpxyGu2N0g_AqRRD_YT7rtYTNuknSeCuoSHwKjog@mail.gmail.com>
Subject: Re: riscv: llvm-compiler: calling convention violation: temporary
 register $t2 is used to pass the ninth function parameter
To: Changbin Du <changbin.du@huawei.com>
Cc: Craig Topper <craig.topper@sifive.com>, Alex Bradbury <asb@asbradbury.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Steven Rostedt <rostedt@goodmis.org>,
 hw.huiwang@huawei.com, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_124010_289269_186B6940 
X-CRM114-Status: GOOD (  11.70  )
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

On Thu, May 12, 2022 at 8:46 PM Changbin Du <changbin.du@huawei.com> wrote:
>
> On Thu, May 12, 2022 at 07:49:41AM -0700, Craig Topper wrote:
> > Changbin, can you provide a pre-processed source and a command line? I can
> > reduce it on the llvm side.
> >
>
> hmm, clang can not build the preprocessed source by itself!

Sorry, I should have provided more info.

In order to get the preprocessed source, you generally can do:

$ ARCH=riscv make LLVM=1 -j$(nproc) defconfig lib/string.i

replace the final command line parameter with the path to the source
file you care about.

Then, to get the command line invocation, you can do:

$ ARCH=riscv make LLVM=1 -j$(nproc) lib/string.o V=1

Then you can provide the output of those two commands.
-- 
Thanks,
~Nick Desaulniers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
