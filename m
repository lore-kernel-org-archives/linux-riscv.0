Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B5AE7D0BB
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 01:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gSZF8V/AIqSP+Wo5fOKL0TlWN2R8REdbEyNSmVn01us=; b=QJG69QLLly1kAI
	EIMAUezTpHHU4yZ/Ja1Gvk794LvDCOGXDUjtCh9+ncn+JVXqZf4bakpGkhjhO8fI53m/6QcOFQnSY
	JKJl0zm5fDqai/HvBkBC7G/8DPcN/i3fHi5mK8WJeylIa6lVumQFs/RA2AC/EZPNxPSkwuBeUFJ95
	JFZ0RP5eQZmETEWlYTralI7UrY6MdEXhVNh3ZR3udV9L4VGiHMiSRueLvMC2no9EKhRxG473PS/Uc
	ZJH4Rj84XoDJXeehjJa8wTWlkwzrkTw4R9538VlrYTbwhYXjmGF2jVet4wIacSIwDf8ZNm86Lyg+9
	jnorH1R9d4sRk6mveWUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjVHr-007aJL-0i;
	Fri, 22 Sep 2023 01:48:55 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjVHo-007aIq-18
	for linux-riscv@lists.infradead.org;
	Fri, 22 Sep 2023 01:48:53 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-7741109bdeeso58443585a.2
        for <linux-riscv@lists.infradead.org>; Thu, 21 Sep 2023 18:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695347330; x=1695952130; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UiIUp0HnbqjxrLPRZup0L6ii6WvuXlyjebdFnom5owg=;
        b=kuPyjg0YWCR/UbqWtkuZhxmOa7whL+wZ0v4COJIyWwcEW04u5f0MWb1SFmSt4pMvXI
         KOrrqyRzBtbOmQPXapuPREis3RUBTSJgxPE7O7NGz7vjHa1G+lBdl47wsHiAI5M8J3Bc
         mJizwVdGwjqyzERHiTbnKqzXNVxMD+0A3Hv6XCFuCtjOjlxQHlI/k8Xxs8kbbPeNdn8P
         kt3VZK7ZF5lWlwOcq4Z0+Mf7VV25knnnrTFUhl0zN/krh/7PSu8mQLyvprlgvFmHvre3
         krv4K5f/2QGfcwdEpnHDkfX7tNhvCJF4kNtNhvvCRrqqMtZFx4nD2Nqwq6ltODiUo+lO
         +S5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695347330; x=1695952130;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UiIUp0HnbqjxrLPRZup0L6ii6WvuXlyjebdFnom5owg=;
        b=X8CDy+LYcXJYgA6Up6dXxGKs5/JPtZe79pIIXpeAow9NP+45uLMNVig8+2EaYJI4sG
         6R83a70+7Z8AvLsUu4Lj9yElrxuLKj2qpf/m76T+PS8XEimQE2dr+2kYO0xziiKk/xI8
         I3ubSBVMkHpCMxsoDsp38DVTFV03wcutshdQVSWF7THRrwhHt/049Xg2oQqeIeEG9Ycx
         hPYmvDowRVkJ9hzZ+XLiGqN+VFHT00DCRfNRqBtv47OwrTV8umEF8zL7YjafOrmvNno+
         qG5D8q2wmzJwatkU/Zd2bgGgfesAkPAAaNsCTYrEc9O0R5EVSI+h6QIYS35jGfvi+6rL
         Camw==
X-Gm-Message-State: AOJu0Yy5lOX8UXJ/C5e1jxvZn0fNv09vNFUYhQrGwDd6VBA7S4BgIBgr
	2OeLWdtEZ9tzXAABqNFlJzaporqz4o2xhbF0rSQ=
X-Google-Smtp-Source: AGHT+IG9+0LFH2o1wrTGPMeXClaqq89OO92QkLkFDzzSIfk8yDNld3wIXiH7/913d38LhvdxYw/3M/3o3o9M9xCMem4=
X-Received: by 2002:a05:620a:795:b0:76d:9b15:de71 with SMTP id
 21-20020a05620a079500b0076d9b15de71mr6693484qka.31.1695347330529; Thu, 21 Sep
 2023 18:48:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1695189879.git.wangchen20@iscas.ac.cn> <c6aea83bb1df563b1f2a66c5f230c3861aed1e15.1695189879.git.wangchen20@iscas.ac.cn>
 <20230920-arrival-bonanza-e335686420f4@wendy>
In-Reply-To: <20230920-arrival-bonanza-e335686420f4@wendy>
From: Chen Wang <unicornxw@gmail.com>
Date: Fri, 22 Sep 2023 09:48:39 +0800
Message-ID: <CAHAQgRASRhpDBj3jNBkj+faJGjc5Ms_jX+hcurnrUKFO9Tn3Xg@mail.gmail.com>
Subject: Re: [PATCH v2 03/11] dt-bindings: riscv: add sophgo sg2042 bindings
To: Conor Dooley <conor.dooley@microchip.com>
Cc: aou@eecs.berkeley.edu, chao.wei@sophgo.com, conor@kernel.org, 
	devicetree@vger.kernel.org, emil.renner.berthing@canonical.com, 
	guoren@kernel.org, jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org, 
	xiaoguang.xing@sophgo.com, Chen Wang <wangchen20@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_184852_414053_81A0FA45 
X-CRM114-Status: GOOD (  20.67  )
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

Regards,

unicornx


> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 90f13281d297..b74d505003e2 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -20063,6 +20063,13 @@ F:   drivers/char/sonypi.c
> >  F:   drivers/platform/x86/sony-laptop.c
> >  F:   include/linux/sony-laptop.h
> >
> > +SOPHGO DEVICETREES
> > +M:   Xiaoguang Xing <xiaoguang.xing@sophgo.com>
> > +M:   Chao Wei <chao.wei@sophgo.com>
> > +S:   Maintained
> > +F:   Documentation/devicetree/bindings/riscv/sophgo.yaml
>
> > +F:   arch/riscv/boot/dts/sophgo/
>
> Firstly, this directory does not exist at the time of this patch, so it
> should not be added here, but rather at the time that you create it.
>
> Secondly, are Xiaoguang Xing and Chao Wei going to monitor the lists &
> apply patches for these files? If so, you should add a git tree here
> that they will apply patches to & add to linux-next. Also, I'd really

Conor, FYI, regarding "add a git tree here that they will apply
patches to & add to linux-next.", I will not add in this patchset. I
plan to add this when we start to take the maintainece work. Let me
know if any questions.

> like to see some on-list signs of life from these people, otherwise
> I'd rather see your name here instead of theirs.
>
> If they don't intend reviewing/testing/applying patches, I can do it as
> a last resort but I would rather that someone who specifically cares for
> this hardware does it.
>
> Thanks,
> Conor.
>
> > +
> >  SOUND
> >  M:   Jaroslav Kysela <perex@perex.cz>
> >  M:   Takashi Iwai <tiwai@suse.com>
> > --
> > 2.25.1
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
