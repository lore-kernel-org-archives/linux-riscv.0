Return-Path: <SRS0=/L7I=NE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D05CFECDE46
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Oct 2018 20:41:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 980D6205F4
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Oct 2018 20:41:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hDzNt8vW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Sw1IUYa8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 980D6205F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:From:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zy95r4GGxn5LOSAPqxArwuREkvJpUsiCk2gv0q23ZqU=; b=hDzNt8vWnPSaaL
	2gQ29KOx8c27kkGIuHXk/QVyWOWIkjl+fkg6EBY/18Pfujl2uco/eNff9LNmYd88PP4MXprWWnTCW
	n05WVtqZVtUdrtn3+hD4rNKGk1aHJOpApf07V2lLayUOsXXdeVIypPgmMuUzDbyGDAGrVoYwTPrG0
	EJ9JRT16sh/ZdbnvAlTx76MsSY2Gf6wJPIy01RfITQhcFq7CNCEk8AsYWxAkkn9wDa16wAnLBjrY6
	G8G91j8seaMduFaLWV/cWoPp6tZYyhOz4h0yjbIQVp6LIXm2UxO46Lxb6aG8YbxZS8mhVh40J358f
	UZY0nDXnK5IbipslitaA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gFPxg-0002MQ-Lb; Wed, 24 Oct 2018 20:41:04 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gFPxc-0002LC-Ij
 for linux-riscv@lists.infradead.org; Wed, 24 Oct 2018 20:41:02 +0000
Received: by mail-pg1-x544.google.com with SMTP id 23-v6so2880058pgc.8
 for <linux-riscv@lists.infradead.org>; Wed, 24 Oct 2018 13:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:date:message-id:in-reply-to:references:cc:from:to;
 bh=f3Nvcbf0Gw3YkxjzeP8g/4jyAF8rPdusxreoDtLe9Hg=;
 b=Sw1IUYa80rtIliU8t37XuCJiVaXpSAv+bg2DJL3O6WZ/4KUvDeqeGyQioxD+E0jW2v
 mMBCdMFXv1IDuK56l5FtBtywQitS15Mv4n194iWXEYI1+EZ0xbpe0d6qQ+AwufVg9hdu
 6hDtxQHoyhvSdy+LcRewChmKhj8xRkHUcaA4JEJBWBeR++xSarzjGvXHCQ82HVkA45Xw
 6WKhaKxRjWM/+Sg+ubGhl5gNXSJzPlMBpCi5OBBmEAko9V93ggoYC9j+EPYJhvM23CWk
 ADnH9Qva/sEyjEMTjXm8vzggmOxUyV4yGTAFr+c9U2GVkx+SFyTmfeC1Kr1gyXy5ppPo
 QEhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :cc:from:to;
 bh=f3Nvcbf0Gw3YkxjzeP8g/4jyAF8rPdusxreoDtLe9Hg=;
 b=qPlpfTJXf7+c/t3L5WuJ3G/JYQ+mW5z5zjDczRR6KMjacL1BCwHwLeGRyAsD5D1DmZ
 gkDo3QV758ZTb7d758QnDDFJ/dn0+bKv99vxZI38jNN1RUPM72OhmeRBOKG5+7IVeZzs
 COY4zt6YGnSQ+gcyNkTBZu7P9QHP59nHd61uokrF+SWXigQmMYCu1SIafsJ+koowKr6S
 iqEOO27TpDVhtV3h7mbXN6ZqunC2xL+H9H4sqizWYO6vp+NwlttKjst6wjyp7kMEQCkO
 qF6lvvQLeg0wFNDeD9XC/L95uwI5TFI1+LpA0LSW2os4kF7m/MV0OAoaqifFxTwikWDH
 WZdA==
X-Gm-Message-State: AGRZ1gLWgvwxdVgS1qCI1qxR4k6hvC5Yw3oAMPaWmIpm95QZGRHPBRrs
 p36VsHu1xDGt8ZO9utnhNk9P4Q==
X-Google-Smtp-Source: AJdET5ekDwAqPzLVvSCKc9c/kWl601c6s0nYtt43/Bn86+aFf87PVchiBPEU9CNKK2H15JVbURyDzQ==
X-Received: by 2002:a63:5a57:: with SMTP id k23mr2496689pgm.5.1540413649439;
 Wed, 24 Oct 2018 13:40:49 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id f28-v6sm6257711pgb.9.2018.10.24.13.40.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Oct 2018 13:40:48 -0700 (PDT)
Subject: [PATCH 0/2] RISC-V: Add support for SECCOMP
Date: Wed, 24 Oct 2018 13:40:34 -0700
Message-Id: <20181024204036.8799-1-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <CAEn-LTqbEmWovu4t7Rs4C211+GRRU4V3B=+WmW0SOhX_b8db5Q@mail.gmail.com>
References: <CAEn-LTqbEmWovu4t7Rs4C211+GRRU4V3B=+WmW0SOhX_b8db5Q@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181024_134100_643133_E90F1105 
X-CRM114-Status: GOOD (  13.33  )
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
Cc: kstewart@linuxfoundation.org, aou@eecs.berkeley.edu, wad@chromium.org,
 paul@paul-moore.com, Greg KH <gregkh@linuxfoundation.org>,
 Wesley Terpstra <wesley@sifive.com>, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org, eparis@redhat.com, luto@amacapital.net,
 dhowells@redhat.com, linux-audit@redhat.com, pombredanne@nexb.com,
 david.abdurachmanov@gmail.com, tglx@linutronix.de,
 linux-riscv@lists.infradead.org, keescook@chromium.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181024204034.2rZz2UwRWQJMIh6sRr8ELzwS4WfLTyf8glYyhUcLl9A@z>

On Tue, 23 Oct 2018 01:20:28 PDT (-0700), david.abdurachmanov@gmail.com wrote:
> On Tue, Oct 23, 2018 at 3:20 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>
>> I'm pretty sure this is our largest patch set since the original kernel
>> contribution, and it's certainly the one with the most contributors.
>> While I don't have anything else I know I'm going to submit for the
>> merge window, I would be somewhat surprised if I didn't screw anything
>> up.
>
> Hi Palmer,
>
> Do you plan to land wip-seccomp in 4.20?
>
> It was mentioned back in August:
> http://lists.infradead.org/pipermail/linux-riscv/2018-August/001182.html
>
> david

I've updated the patches to live on top of 4.19 as well as cleaning up
the Kconfig entry.  Unless anyone has any comments I'll add them to
for-next and submit a PR next week.

Thanks for the reminder!



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
