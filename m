Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA3AC433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Mar 2022 11:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Do9uiOmt8g1gTiw14K3ni1tR+aeDYThIyS4SfMVPK3I=; b=iI/UnF8SULGExG
	LWBfmvWbmPYXg96PBkR4WU75yLc8ywY7NhRI41twPhIrk+GI/e9bOD+lez3myMuvf+aF/hlWoh3bO
	5RWjZJU/BdlX+6XbZRh4mGXCknP03waxOv9nL6ruTNsJETJuwsxnpWS/DeTZL4B7OHcSeyyBjadkr
	3IRmEcdhaR+UyGkVILq4bB4OnyAA9HOqNIQsujqaDyOp2+QoBvR51e4BxwledJgnQ7dGEGD3Sax0y
	0078Wd1dimVWfl6t+aX6gDonDczqJKH/l1XBeWmn8YQ7ONzNFqc9N0S7H42kyWAV3sWPtXRrvWEK2
	5kNEuwGn3sSMruTsHUwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRuoJ-008OKZ-Pg; Wed, 09 Mar 2022 11:48:55 +0000
Received: from mout.kundenserver.de ([212.227.17.13])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRunb-008Nym-Nj
 for linux-riscv@lists.infradead.org; Wed, 09 Mar 2022 11:48:13 +0000
Received: from mail-wr1-f53.google.com ([209.85.221.53]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N2E9Y-1o9L0D2k5G-013hNR for <linux-riscv@lists.infradead.org>; Wed, 09
 Mar 2022 12:48:07 +0100
Received: by mail-wr1-f53.google.com with SMTP id r10so2621430wrp.3
 for <linux-riscv@lists.infradead.org>; Wed, 09 Mar 2022 03:48:07 -0800 (PST)
X-Gm-Message-State: AOAM531mrwOT51MiReHQIt8UqN08HQxK/7gMstsAZENB0KNdaNK+hHbQ
 2h7dlkh8ZlZzjLkaRdWGBFB/NfeIfK4bwtr/8UQ=
X-Google-Smtp-Source: ABdhPJx8CmrEkP9lIy7Z5de0qkV2NmzIOzmwBGL9JST+3PaDpmd2sG65KYvqwn/RglW3lLU3PwBwOhS6PRPEiVwkkUI=
X-Received: by 2002:adf:e181:0:b0:1f7:7d5e:c3bb with SMTP id
 az1-20020adfe181000000b001f77d5ec3bbmr8821463wrb.12.1646826487258; Wed, 09
 Mar 2022 03:48:07 -0800 (PST)
MIME-Version: 1.0
References: <20220309052842.247031-1-michael@michaelkloos.com>
 <CAK8P3a2Mr_z6h7eg1O8ZN5_qE-o+8KFFBum3CxyuDYeF50s1dw@mail.gmail.com>
 <e936de26-95b7-1eed-008e-8d025b638265@michaelkloos.com>
In-Reply-To: <e936de26-95b7-1eed-008e-8d025b638265@michaelkloos.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 9 Mar 2022 12:47:50 +0100
X-Gmail-Original-Message-ID: <CAK8P3a33g1D2mE2Z_ZsukMCBZ3gCGdDbH+2osHZe0Y8GoO_5UA@mail.gmail.com>
Message-ID: <CAK8P3a33g1D2mE2Z_ZsukMCBZ3gCGdDbH+2osHZe0Y8GoO_5UA@mail.gmail.com>
Subject: Re: [PATCH] riscv: Work to remove kernel dependence on the M-extension
To: "Michael T. Kloos" <michael@michaelkloos.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-Provags-ID: V03:K1:B1+naipvN697D4R8O/tPX9wchm+pbbeX87bnxedbfK4paugKp/V
 ppB6mYXxrv1MzN1KbdR/3oJxJtzobGksYd5e4wpKYv9raHSwrd/60OFrCfFEwiTu81v7IYv
 TfZ3JCuLgcLMJ8QEijA3ID/2ioij0jJAUH2FZhi92awykfInMJkOuH7UgNfdOyDMMY9Qr5s
 kCmhQL3Pzb5bi9Zq5bV+g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fDWhjIYWhq8=:PoPTnsMYCa1urNMXvoifTC
 WboGFiEBpvPJsc1cnkZY1XL+aNob/24iWTo2JP5+ImV9IIJQJn5C2G1qO/9//hYCN+1DHvITM
 WfdRntgM9LIELlU3lAVSAupDMfEXa5nbAjdxuM/DMR7UklOmYqYWZMILWrwbLWR7Qhhrj9JvZ
 qc69KgQtycHrqEhPddckDVVwclklJj7YVpz8z/q6L3fKiE1pqYGG2EnTqll7/mu1FefPlg+ML
 kmZVGEW63ayW2YhKbrD6fDHW6l8QNp60XN+TDfIFC9oWzN0glPxu7WEmwa1SJvejccupMO3Yk
 Xj/jSohYRNt3jx563Yg+/0BkSSWQayS1b43S6DlmjJGl8DA6Q97UCa+/VeeKHdKNDhA9Ld/BO
 6p7iGmKapVoNQdLE5j9/Qn+1fHCl+9QqJqJGyFIdUm0fGdEiTIu0Dp6F9VQ+ZQ1N6C+mU83vj
 sDfvw4M/2EbBFe1qSQVPkJrnMxFXr1rWKz56P/IFbjWDooPvoGGAu4kXV1cbaCS03HboZi2T/
 1utSnkuoasgK2bvbFvZghTlcI5AYTsazHkjssJD2MSJkoCa/5YIH1J2JyoAdSOPseP41BR0Sh
 RRaHj1W8khNg1w1YBeMtOrnafn6mGXPCcSdqVvS8L1K1mAu0VlgibWDGyapJCLlRUQQQg/luC
 +kHCrBjCwXW9APzZwP37j0fGTfKJU4x3k/p/NOKZr1Q1dwigbvxmv3yuEBXmNsETlzGQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220309_034812_112644_3A0AEB21 
X-CRM114-Status: GOOD (  20.93  )
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

On Wed, Mar 9, 2022 at 12:43 PM Michael T. Kloos
<michael@michaelkloos.com> wrote:
>
> Thank you for your feedback.  I don't really have much of an
> opinion about that right now aside from that I know where things
> are in the current structure and am comfortable.  My goal with this
> contribution was to keep it in-line with the current config
> structure.  Hence, I put it right next to the menuconfig option
> to control CONFIG_RISCV_ISA_C under Platform Type.
>
> I wouldn't necessarily be opposed to rethinking the way platform
> feature selection is presented in menuconfig.  If people feel that
> most users will be looking for an rv64gc config and that it should
> be made for clear, perhaps it could be done.  I would need to do
> more thinking about how exactly that would look.
>
> I do think that it is outside the scope of this patch.  Were you
> working on something like that and worried about a merge conflict?

As I said, I think your patch is ok, and I have no objections to it
being merged. It's just one more option among others that
can cause problems if users get it wrong.

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
