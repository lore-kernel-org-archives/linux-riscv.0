Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1CECC4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 15:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HEDaN7sQ1V/0KUkMbVAEulz2tWSXtK1OrI9cK47Pfv4=; b=tPZC7Nln9Y7UV5
	2OOoCfwj4HTrF2vtKsE2vgCLShIeqAP11T1TKxaZEmyEu7em9n4+/xLfavX2d8/IUy5K9NOfxyDdV
	CHhTHOkqkMUKb/aPzcokucOoUID3hQWih38z0rKUkQ3V9pKq2G9Fww2X/lX8jXVPy24fwkCeCt8yR
	66wz3wKx3EKnk+JfpQ1e4B7sk0bIELtgAD19SJ0XQDNYcVwNnzdi6ZENctRzr7IZcpmDsmFDF7Kvg
	YycxebfalzKZj18iWenKs0quJFNsUefTvgGiENWodiHlSKhLO56LIMY+fry26kM4RWAVuIfNID00n
	vWeCeLPRLa8BcIa+FY+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p02qk-009qU8-V4; Tue, 29 Nov 2022 15:48:47 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p02qa-009qQz-7A
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 15:48:37 +0000
Received: by mail-ed1-x534.google.com with SMTP id b8so20304158edf.11
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 07:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VIRe95Z6jcNjLS0kWdXMlZ6r3LFNPa2W1G5woacMJko=;
        b=meU+ykcNyiAq6Ope/bgI1B6cXVFFCv8w5gGeixY5B4f/VQ1ZuJkGoo66jb2d2xfIgh
         DXDg1OF1N5lOE7QH1BTuURIYVuG6EQkJ2nDZE2+AcvcM++OoJ0I9vi/ddhhFfeVoT+65
         8VUn4blseN0/qhD746KdFJq36mVXIET3ERHbcVcTNd/W3AwLYSN53x1EahSFZSohu9nY
         uhbOmyrUUbQe85kxJ8Poz7eLXRcijVLPmZxRRdbQY+ygoqLXnONTPzz65w5aroAqLtD3
         z33KeTPnVXYf+7pDR2BnSpTQu9Y4w/az6q3NOGvOzJWuVmuOt31Vn0x6zb5M+cECyxFU
         dcag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VIRe95Z6jcNjLS0kWdXMlZ6r3LFNPa2W1G5woacMJko=;
        b=KmtEGj45TQ/5egvJBBw6L5qrsLZ+ZlA8CrdXS9k7G/lyXDcwIiZUv51ixT/yI+Sx/P
         W/CI8MQS7UkrRhyvtLb1gnOsCkaPbz1gYGgosv2Eqlp9RKTMoTeVEPQI/f4vUQXINeXd
         9J83XKHqvBJLi/mEg3HQWHrux6Cje+YVGuVsFMNfsWAuKi3PwScLhl2kLKqvxKa1BpDQ
         sj3QTnhCUpSQYLbfdZ08xADw3ED2DqBqPT/8cRULXldZKIZh9uwATqpMYnCM7jxRHjZa
         QD3tlbkkw5vAF2KnXKo+yBZ2GBdXGkXP3GVY6CqCe0yPbuVlXFVAzOIWSYgMtzZMhQ9e
         102w==
X-Gm-Message-State: ANoB5pkTS+Dyne+YDRsaT0GrSYkxrQxuV54kIWeDDFSdlxxc16Tdlilj
	9WYXHc9WDZ/l1KdSnIK75ZhEKg==
X-Google-Smtp-Source: AA0mqf5s58TQL7Mgsv2sX2m9+Mz1iCbc1RBtYKkkrGp3bN34Zcsvk1cIPnxBuOBedDqeyZsDPTsW8Q==
X-Received: by 2002:a05:6402:5413:b0:458:211d:cbe4 with SMTP id ev19-20020a056402541300b00458211dcbe4mr3453537edb.11.1669736914018;
        Tue, 29 Nov 2022 07:48:34 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-748-2a9a-a2a6-1362.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:748:2a9a:a2a6:1362])
        by smtp.gmail.com with ESMTPSA id t7-20020a1709063e4700b007be4d8a50d8sm3918194eji.70.2022.11.29.07.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 07:48:33 -0800 (PST)
Date: Tue, 29 Nov 2022 16:48:32 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
	conor@kernel.org, devicetree@vger.kernel.org, guoren@kernel.org,
	heiko@sntech.de, krzysztof.kozlowski+dt@linaro.org,
	linux-kernel@vger.kernel.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, robh+dt@kernel.org
Subject: Re: [RFC 0/2] Putting some basic order on isa extension stuff
Message-ID: <20221129154832.27or3ywsx7npuqzq@kamzik>
References: <Y4XvnHIPw8ZuBZEk@wendy>
 <20221129144742.2935581-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221129144742.2935581-1-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_074836_291343_4646C0D9 
X-CRM114-Status: GOOD (  19.17  )
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

On Tue, Nov 29, 2022 at 02:47:41PM +0000, Conor Dooley wrote:
> RFC:
> - I have not even tested this, I just did an allmodconfig
> - I don't know if I re-ordered something that is sacrosanct
> - I don't know if I changed all of the instances
> - I didn't write a proper commit message for "patch" 2/2
> 
> With those caveats out of the way - all I did here was try to make
> things consistent so that it'd be easier to point patch submitters at a
> "do this order please".
> 
> I never know which of these can be moved without breaking stuff - but
> they all seem to be internal use stuff since they're not in uapi?
> 
> @drew, I didn't touch the KVM ones - are they re-sortable too? My base
> here is rc7 so if you did a reorder at any point there I'd not see it ;)

Right, we can't touch enum KVM_RISCV_ISA_EXT_ID as that's UAPI. All new
extensions must be added at the bottom. We originally also had to keep
kvm_isa_ext_arr[] in that order, but commit 1b5cbb8733f9 ("RISC-V: KVM:
Make ISA ext mappings explicit") allows us to list its elements in any
order, which means we could sort them in canonical order, if we wanted
to. I think I'd rather have them in alphabetical order, though (they
nearly are at the moment, except for the bottom two...) The only other
place we have ISA extensions listed in KVM is in a switch statement,
which of course doesn't matter, and it's currently in alphabetical order.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
