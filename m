Return-Path: <SRS0=xvkM=QF=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 939CFC169C4
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 29 Jan 2019 04:28:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 525AA2175B
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 29 Jan 2019 04:28:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ElQD/p3x";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s7cUdX70"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 525AA2175B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6DGpq2dnoHJVHXvNDZESt0hQOs2PEGDb9jm7lVe6b9s=; b=ElQD/p3xsyN3hk
	gXySld8HxABwd7pCyXhDn7JyLI4tcuGUlwDsslr6MSJr8+g4HZgGY+y8tgb9nU3edSrw7gQHhbu7Z
	Qg8huia2WgyU902s8M24u4db3PpXWOdnKWXgaGoRTJJJS/QOQRuW7sJ+Z5WeVmmcSudDigAIFf4Fl
	LzFN/3WHDFx6djh5pxEJmwdbaZtlqiJT6XyJZ8s9i7wy/VdFEbC3JQNArv5rD19dqQzOsBJvuHIXe
	DFbRkx+2IClGchMTIyY0jWdKJtlz1bDKlcej1nKz6l6tn4+LqBHe5XpYOaZPzwg5DSXM+hN+1VpWd
	L+3I+PUCY3x+KmlJDJ3w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goL0s-0008Fi-KL; Tue, 29 Jan 2019 04:28:42 +0000
Received: from mail-it1-x144.google.com ([2607:f8b0:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goL0p-0008CC-JP
 for linux-riscv@lists.infradead.org; Tue, 29 Jan 2019 04:28:41 +0000
Received: by mail-it1-x144.google.com with SMTP id b5so2106978iti.2
 for <linux-riscv@lists.infradead.org>; Mon, 28 Jan 2019 20:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FGrtnITcnN0MWSc0YWVwdfETM6yCewdxDzIwVtZhqeE=;
 b=s7cUdX70cRz5xoeJxn2bO1f5UdUOc62C5gv0CYc/6j0LuMqDdgktmE5mfU4HX5qP83
 hbhoCaN6TmfkkYjAPQen2xLT4Ppkc9w/w5JQMqT/w2MxLgV9BVXlsg5bA/zT5QZeDbDX
 lROlVGFZtdRUJHK1TP0iuArLMINYHANYsmTLQu4sKCIYDhD6vHB8T+fdm+ySwxEkVOct
 MShPhYm45tF/873VIRz9s6S+aTea42JY5rgiMxO91SMaojExAjR02I6AXBNm3r1D3Eg/
 wtGqD0aUhwE2AyV089LysvR24t9a4i+BRk+Xbwse55nmJ1SojEUeXi5uorDD4AnA4rwa
 d1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FGrtnITcnN0MWSc0YWVwdfETM6yCewdxDzIwVtZhqeE=;
 b=inX3Gxd+TsuVM4dg1pGFyRGW8Ni6oFfZkMtA60DgQJ4rnSkkPxDnZrnWEa1RaTKHwl
 QAgHpjM2Z+Iuzc5h6MLR2NDE98U0UG77ep8G5KP8ul6k5JrG3j6IQ2sAwG34yen1Uva8
 i/fxxkH8qNFZKiu2qD6zHesu+btJnkEnW8brqbPK6zjJuNUuXN/ohrZW/Lwfd8v+ooWi
 3VR91vfkHeN3C0Ie4LGVjShnBGr3QrbTIFJmxJAzgkFZIPRbqyr8bSbv3vJIlSdcbMMb
 mg2e6VuQAOQ7TPVhOOkk2eoSEBz3U/XdeX3+5tv1xtvXLqkisnpGLsdD7/SYxLye3Fe7
 VXaw==
X-Gm-Message-State: AHQUAub0tbGJFjv6JyJ9tUsxyene3SqwARBTfZggzK6Cg3HuBmuAmCpc
 MwLYA5WUVWCMqS2MiiOUf9PulN9KXgfFi3tV0Es=
X-Google-Smtp-Source: AHgI3IYCZ07ciXatkZtvE9wA7MGD5sSyh2Tynws+syjI6rNPG09X6Mu0BolC+tGOhAMppZIn+zlaMiwbXJDUYzV450o=
X-Received: by 2002:a24:9646:: with SMTP id z67mr2288097itd.153.1548736116863; 
 Mon, 28 Jan 2019 20:28:36 -0800 (PST)
MIME-Version: 1.0
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
 <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
 <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
 <CAP6exYKfhtgXz4nVSwXasicbE+8ZbKwp-15_xGFHfFoK9yi9-g@mail.gmail.com>
 <7efecac7-17bd-5fc1-d0de-9fd498db4751@wdc.com>
 <d476c0e2b525fb0642b3155a247495cb1850c208.camel@kernel.crashing.org>
 <452be0d3-da8e-643e-9f91-c38f0af36ffd@suse.de>
 <CAPweEDwdByUTHnbKGS-LbwGzqsjjWciWOBnPOKkNqupY--vV2A@mail.gmail.com>
 <033872b8-49d5-2731-118f-967488f4763f@suse.de>
 <CAP6exYJRhw=nnhdrNQc7wOBUTYk0-LNaRQrhin7fqxeXMrEhkQ@mail.gmail.com>
 <CAP8PnuS4vE-w07dENEpJWx_nu-yx3fsyM3nu3kUQoVFW5nzJcQ@mail.gmail.com>
In-Reply-To: <CAP8PnuS4vE-w07dENEpJWx_nu-yx3fsyM3nu3kUQoVFW5nzJcQ@mail.gmail.com>
From: ron minnich <rminnich@gmail.com>
Date: Mon, 28 Jan 2019 20:28:24 -0800
Message-ID: <CAP6exYJD0Qrnni+yCUBdNWv0tmR=3vYzLwJTy+oOnQEb83ja1g@mail.gmail.com>
Subject: Re: [sw-dev] SBI extension proposal v2
To: Bruce Hoult <brucehoult@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_202839_665982_33CD0F2D 
X-CRM114-Status: GOOD (  10.49  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 Christoph Hellwig <hch@infradead.org>, Damien Le Moal <Damien.LeMoal@wdc.com>,
 Olof Johansson <olof.johansson@gmail.com>,
 "alankao@andestech.com" <alankao@andestech.com>,
 "abner.chang@hpe.com" <abner.chang@hpe.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Palmer Dabbelt <palmer@sifive.com>, Alexander Graf <agraf@suse.de>,
 "zong@andestech.com" <zong@andestech.com>, Atish Patra <atish.patra@wdc.com>,
 "sw-dev@groups.riscv.org" <sw-dev@groups.riscv.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>,
 "mick@ics.forth.gr" <mick@ics.forth.gr>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Luke Kenneth Casson Leighton <lkcl@lkcl.net>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Andrew Waterman <andrew@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jan 28, 2019 at 3:22 PM Bruce Hoult <brucehoult@sifive.com> wrote:
>
> On Mon, Jan 28, 2019 at 11:40 AM ron minnich <rminnich@gmail.com> wrote:
> > Short form: if the PMP makes it impossible to measure, disable and
> > replace firmware from the kernel, then PMP is a bug, not a feature.
>
> I disagree.
>
> The owner/user should be able to change the SBI, perhaps by booting
> into a special mode. The kernel in a system running normally shouldn't
> be able to.


The nice thing about riscv is that we can both get what we want here :-)

I can tell you that security-oriented folks I'm working with much
prefer that the kernel be able to measure, selectively disable, or
replace firmware; and then set the PMP registers. The kernel should
drive the security, not firmware, because we have such ample evidence
that firmware is far less secure than kernels, in how it's written,
how it's built, and how it's deployed. In such a world, platforms that
do not allow this will be marked as not trustable.

The good news is that neither you nor I have to to dictate this for
everyone. There are going to be multiple SBI implementations and
firmware implementations for riscv, and we can see where this ends up.
One thing I can say for sure is there won't be just one.

ron

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
