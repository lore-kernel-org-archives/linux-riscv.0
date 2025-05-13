Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED6AC3ABD9
	for <linux-riscv@archiver.kernel.org>; Tue, 13 May 2025 10:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xNglt4cKL+4TjdtA0yBgxMMs8HSPU1EBrbaDz+mMHcc=; b=Gzwq6xF/c/1bEz
	KhrC1YVtuttPeBvRp2DSyEYqAZfLri2FtShNxRBolHDPHMlySb+/N2c7VfX8DSXV54H9od1wO0MAC
	H3NJ5Jo9/Js5Wb/zNRwCGNxBwxwctl9+wBr+fHgXMiccG5whtxSSMpMsMq2uO0HY6oOrAYHZgwhKZ
	6lSB0IoN6TmOANyOxX8PHRDCNRTXcrrzSy1CQJy2OtxVdereH9Uyq76NIYbcT+ozRkQSltaBhG1Qd
	a8NJDwiVMHvn+X2DU/miyHTBnu3ZLAQVeXHx+1OAs83A7eun3w3q9q9R9b89tuz4yfKUYMmWRj33p
	/GXakWGeeMq9p3NuMFiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEmYy-0000000C1iA-44sr;
	Tue, 13 May 2025 10:08:40 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEmXD-0000000C19m-0FKW
	for linux-riscv@lists.infradead.org;
	Tue, 13 May 2025 10:06:52 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-7cd0a7b672bso230998085a.2
        for <linux-riscv@lists.infradead.org>; Tue, 13 May 2025 03:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747130810; x=1747735610; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=esbxdNvjy4b/7wpZaEF1nYSaUdVOz5XoWiu+PSih66c=;
        b=BlrE47/zq/0TFMdHkmVx+oeb/0QLgIFrp6Objs+8nuQ6juw5im3/0a0EH5kzto8oT0
         08KO2dLX1lHrxrQKMEqNY0umRa+bkIDYytf0J88+kMnZypanUid3TDXvbKQxhqR8H1Tm
         EQWkr/72s/+Ar0YN1zY8LpUODsStTqfCC9pIc+zRE5NVUOwPMYZNt+/wSGyucksHkkJz
         g4DbT0uy/ebQmde4u1Tu03JzZPDCRVBCRLDwOMD0w0FnTW50imuu2D5CCytYWYhSDG6o
         HG3vgmBfK7NiUnMPMEOj8NXsLfZpXdZ2lvAbvHkhbjkwWMeR5dqNDltVXKcSbzA32fij
         HzbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747130810; x=1747735610;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=esbxdNvjy4b/7wpZaEF1nYSaUdVOz5XoWiu+PSih66c=;
        b=GqwKrYowXckQ34L1bDLf9Vt5qhn4pMkF1w83f6fPz9Mn3YTERyK4v3Ikf6lZaX3ZCO
         NA17dTw4UJrQUJ8+WAdhED1B9HMuZnWfwfoWJW5gtFjQvSWSbKsxzG4eyN3rHYSFy8UR
         pFQRrK5J9MbyZadHuJoPOUGYEa1fqv48t1/3pNrZPAu8GDVxphFkwJ+prBiSswcdKH7n
         YHYx5JOKm8goWb12NSHNPC8JBdJEFz+tYn8xjasaZMMhEpSvy0jFvmvab4E5X+jhyWeX
         cfOHtuGX7CkXUH7j9YCWBYZMaG1nw7xckp8uC5XbVgsAUIjbZpJNhwVM5OQ4U4gBJXZk
         aNFA==
X-Forwarded-Encrypted: i=1; AJvYcCULagJVR5bfNnE2f9aLtLkPn57HUviTjCfHN4nbBtxZY0ecb5t2kh5kLVXqGah9E7NX4WP876bEfqpS/w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxh6xAWk2D8wxx6+TQ6bvlRXn6xuSo7vvv6dZSTjJKqkFrWYJGt
	gv7/hXy9LR436UjWNUA2s+sO84JojQTkS3nm9ElA2ul/WUco920m
X-Gm-Gg: ASbGnctkHzimz1tFrCELUZ7uGzYs/MlmVPOlvGq7LE7l+bPuKnZZYxkhNDubNX+tqRt
	sGuIVICAPLeTcMsQBeyracoxoXRJ9v0Hd8rjpv4ksmBhaEzQWGyDVnWQeHn+XvXw3yCah/a/DLi
	tftbN64xvJT7SuSJwymki2B7kOqlgY+lkNSkWIb8duXBJu/IdDWdboBphGfp3h/+VrW0yuUWvX7
	vwieEuJ65S7cGBdtSSDs36jjrEQy6gtKZsYnH9kIiJK/RdfPS93SCcx1W5a3dcPufISRu78uq1x
	VzUI6hBT5/4wwMr8C6ctCXUUSB0=
X-Google-Smtp-Source: AGHT+IHDCPxylkGBs5YFIF69NQPWPn69nrjCxDe9tRWkw+WoCwAjvrZ/m3yavqIX7i0p+MInqxI/eQ==
X-Received: by 2002:a05:620a:248e:b0:7ca:cd16:8f52 with SMTP id af79cd13be357-7cd010d0fbemr2232965685a.12.1747130809769;
        Tue, 13 May 2025 03:06:49 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cd00fdc5ebsm691892785a.79.2025.05.13.03.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 03:06:49 -0700 (PDT)
Date: Tue, 13 May 2025 18:06:17 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Guo Ren <guoren@kernel.org>, Chao Wei <chao.wei@sophgo.com>, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: riscv: add Sophgo x8 EVB bindings
Message-ID: <23yyxygtz72mbeebvzjdl2k3us5rjssgeg5k4wb4jvwrlj6bju@s6jxjwf5p6tx>
References: <cover.1746811744.git.rabenda.cn@gmail.com>
 <59c175c7bccbd4b5ad241c39b66b0303e0facf81.1746811744.git.rabenda.cn@gmail.com>
 <MA0P287MB22621824B2FD5E2A64006174FE97A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
 <CAAT7Ki9=ROP47hsugf3BS1nXr9oOPHWgjQoGfjAZiwHnXS19Pw@mail.gmail.com>
 <nrtzltuus47rjds3x54e72mtflvjh4najyqdjnagxq5etge5e7@vkikyxa5zf6k>
 <MA0P287MB2262F586320C31A7F887B5CEFE96A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MA0P287MB2262F586320C31A7F887B5CEFE96A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_030651_096490_D1EADB9F 
X-CRM114-Status: GOOD (  12.96  )
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

On Tue, May 13, 2025 at 05:59:23PM +0800, Chen Wang wrote:
> 
> On 2025/5/13 17:49, Inochi Amaoto wrote:
> > On Tue, May 13, 2025 at 02:48:44PM +0800, Han Gao wrote:
> > > I hope it is sg2042-x8evb.
> > > 
> > > Sophgo is also making EVB boards for sg2044.
> > > 
> > > I think a distinction needs to be made here.
> > > 
> > SG2044 evb has a formal name like srd3-10, but I think it should
> > have a sg2044 prefix. as the name printing on the board has a
> > sg2042 prefix.
> sg2042 prefix? :)

Yeah, it prints SG2042_EVB_V2_0.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
