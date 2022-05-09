Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6324C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  9 May 2022 09:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JuqdXAJ93Q2lqkUgFVphGzeRFRXaBbF8UfE1hA3L0VM=; b=jEU99XHJwawpho
	qUNnjKk7UkbzZ9RKpSCGPfYGUxgOu249YorDMGxSi5YQnnQv+29CPuCWBAXoxyOk4FhBDQy+M6dz2
	VAC4XQ/d8VhdA3RGhZuU4RHZi2M5UmtGmKP9ELEHihva+Clc2m00whQar4Aln1y4f0hfySt+3TeG8
	fNqX5iIwcuN0wMd1WNB+InmtNz+JBal17PahOSKMJSTxrxASWMDpO21Q0lDpZGR8CaUF7TTS79ZPO
	8kvxl70qN/kc3HQv2un2yCnUhrNNZq3GdjZWqMnhRV3tR1Dyo8DW8yClZjmiguKJvqbNFtAmwGAMR
	5GZRBx9Ge3LT/OQEnXfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnzrw-00DWyY-8S; Mon, 09 May 2022 09:39:56 +0000
Received: from mail-wm1-f48.google.com ([209.85.128.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnzrk-00DWu0-Ec; Mon, 09 May 2022 09:39:45 +0000
Received: by mail-wm1-f48.google.com with SMTP id q20so8033565wmq.1;
 Mon, 09 May 2022 02:39:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MIo4iJaNWWiT8L0aREHccyFQKBU+YIpBaS+29bvc/oc=;
 b=TBxoqLieYbdI8TOPshLkexlk3fd4DAgOXwYKVIdeVU9ZfDuDoSVl67TbJkQBGENE4y
 Hlzx7lFbBSmmNum7eN5KafQLQCL9Aci1tAu8km85px+b6ffN2/rDIfg0/X60pJvFLajK
 +H9Hik0sJ3QmRvagSPMaRLuDYHhhaBY+JL8LzKEHjkssFaUXb1vfLkxW17jgfeiDn/Um
 E03zsK5mQk+u+JBt4KkkN0/hPRYYGyh4Y9IRwvTolCQzInKgEdVebQN8//Vbx0Sia6x1
 lN4Btm+KEMH4Nz/5qXr4CFze7WyjLn3adnl8YAamSZwgQRztTa176qP1VIPN3Egx87qK
 72CA==
X-Gm-Message-State: AOAM533aCtBocMIlE8/oo+ofOoTVNmfkktuWrkAH/rgXbLx0QFhnIBmN
 /p8CtsDxPVQNiIT98Ec68rE=
X-Google-Smtp-Source: ABdhPJz/KKcTrgbBKiQDbLem0UVallm03r9n1V5yq/fpMjCoclkduFXgbKOowrI9BpO7enF+NSOlDA==
X-Received: by 2002:a7b:c4c8:0:b0:394:26c5:b79e with SMTP id
 g8-20020a7bc4c8000000b0039426c5b79emr15176076wmk.15.1652089180818; 
 Mon, 09 May 2022 02:39:40 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id
 w7-20020adfee47000000b0020c5253d8efsm10503017wro.59.2022.05.09.02.39.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 02:39:40 -0700 (PDT)
Date: Mon, 9 May 2022 09:39:38 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jarkko Sakkinen <jarkko@kernel.org>, kunit-dev@googlegroups.com,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 live-patching@vger.kernel.org, Wei Liu <wei.liu@kernel.org>
Subject: Re: [PATCH v6 00/23] Rust support
Message-ID: <20220509093938.fdrh5hhhreqi46wn@liuwe-devbox-debian-v2>
References: <20220507052451.12890-1-ojeda@kernel.org>
 <202205070056.ACC3C3D@keescook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202205070056.ACC3C3D@keescook>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_023944_526201_4EC25301 
X-CRM114-Status: GOOD (  18.89  )
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

On Sat, May 07, 2022 at 01:06:18AM -0700, Kees Cook wrote:
> On Sat, May 07, 2022 at 07:23:58AM +0200, Miguel Ojeda wrote:
> > ## Patch series status
> > 
> > The Rust support is still to be considered experimental. However,
> > support is good enough that kernel developers can start working on the
> > Rust abstractions for subsystems and write drivers and other modules.
> 
> I'd really like to see this landed for a few reasons:
> 
> - It's under active development, and I'd rather review the changes
>   "normally", incrementally, etc. Right now it can be hard to re-review
>   some of the "mostly the same each version" patches in the series.
> 
> - I'd like to break the catch-22 of "ask for a new driver to be
>   written in rust but the rust support isn't landed" vs "the rust
>   support isn't landed because there aren't enough drivers". It
>   really feels like "release early, release often" is needed here;
>   it's hard to develop against -next. :)

+1 to both points. :-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
