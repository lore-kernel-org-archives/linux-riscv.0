Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DBA4C04FFE
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 15:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OiO9feP4Tj0qkHom6nvmp6rLp41MybK9G7v8CSiNhN8=; b=VYI1B270yW2oRp
	Gg2ijSgKNTZpahTMIcuNnl9ZsQ9d7KkXO0z3VGplxJhS93rk8UmYZPAnzTJv/ljoXVb+YkVW5W9RJ
	EO/blCoB1m+dbMOwzKtYOx2Kc+l6WN4BeGy/gIIULy2VjXU5Xz/ttktBLobS7k753+If2xEt78Lse
	demDN/Mio90j+9Sbtbj8Ae4gtkyL7f8+h/oMZ/lp8SxptwYmqm0l+ZI2j86pv+pqPSv6fQvTFr3PZ
	UYrYabrBmoeE06JCvOxQmo/j9i6q6Ccrck9iNuEc+19GtoKpmNBInzlx5dDwPoiWi/i7sMIP4D2++
	siu69HhBJEaxhnsAtU3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4iqi-0000000Fwa9-2Lz2;
	Wed, 08 May 2024 15:04:52 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4iqe-0000000FwYc-0uaf
	for linux-riscv@lists.infradead.org;
	Wed, 08 May 2024 15:04:51 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5731ffcc905so42328a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 08 May 2024 08:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715180685; x=1715785485; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tJrWu9Whp0wr1T9bbbciMuTI/AD/aYy1LnPMSROlLEk=;
        b=SKBf37atKV9OG5Y2a9KkjSgavr/2DfTHom+POmMPaXa6yJ6wZ0IAAIa9BOgRzXxr2Q
         4KHa4ojkvfB9+EBoAsVgMRPVXOV6Z+Ei/KAEVF+uGbRe+yl9QsoIEfMA++TzCPwcRjfd
         xeqbrxNRtO+kzBRlJC9lBxbX2b9H/wPiRex07llx9g5hssv/+4EBLOPVc+/GM3Je66Ee
         +3+V3L8IyrhxYrAiaqe8ZzLryYaw8r3SQxxkvXh2oVhauXXyvPJhnm8tHArU6QdSe1HL
         /IjCVBMCsP2RTxnHpG+GpHG0OWES87o4/QLB1RpF+xSAfJm8lIKwjlk79UBIcDv99g5C
         4lcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715180685; x=1715785485;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJrWu9Whp0wr1T9bbbciMuTI/AD/aYy1LnPMSROlLEk=;
        b=ZvwShYBVAOq5aqAxXsvZEtH3HLtKTpt2xhCLSdzc32+a0LrTpHfZW95TlbskujPKV+
         OCPJd+KYXv7k2fUW5brG3hjwMPpoSS86YnYXc+5MwkmZuQveX3HfxT62qOZEqOi34Fev
         4a8ggLU8Q57GfShK8Nc5bNm7aKtJgmVxpsWUiqxOwPhRR+hpCe4+TnZ6cYFiKZ2aOsnY
         Hf7XiDkfO2LI24Dy6/XBFytKdICtKu5HjuRLdfSlD1ks0orCmj0tc5huKpb1sCp4fduC
         DvSUpJpfjs7nWwT7aK7pKimd9JstHUdC3OOXd/7Qzr14m0LpdV3YASxc4xTZqghOBMSR
         5q8g==
X-Forwarded-Encrypted: i=1; AJvYcCWKWJhMqmav0Ik66+ESekOF9EUCxYxnNiqbLbzw4hWzo3VRuvKH5+pUWGpj09ZabV13maMK1Ok8Or5T578VtuIKHFCuHS5/nKh3jkHUjvt/
X-Gm-Message-State: AOJu0YylVQ96F4nFNYPEAI+udEpIt4QjsBMRZ0j/mX2v8DOVV+hL6guW
	SQm/50wcOd9YQj0VisOvn0omVTVV7CBoMOXgsJwyejVcyx4+ust4
X-Google-Smtp-Source: AGHT+IFx+82kU+y/X8A0C7QolVEnU4iqiQMFz3TejkjlEh5Tjdmtnr8bvuyHqrIAkEOIp1VVYsWh5g==
X-Received: by 2002:a50:f616:0:b0:572:93fa:d6fa with SMTP id 4fb4d7f45d1cf-5731d923f4emr2148830a12.0.1715180684954;
        Wed, 08 May 2024 08:04:44 -0700 (PDT)
Received: from andrea ([31.189.114.81])
        by smtp.gmail.com with ESMTPSA id es26-20020a056402381a00b00572e2879500sm5484449edb.53.2024.05.08.08.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 08:04:44 -0700 (PDT)
Date: Wed, 8 May 2024 17:04:40 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Puranjay Mohan <puranjay@kernel.org>
Cc: Daniel Lustig <dlustig@nvidia.com>, Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] riscv/atomic.h: optimize ops with acquire/release
 ordering
Message-ID: <ZjuUiHp4Qc7EzuOz@andrea>
References: <20240505123340.38495-1-puranjay@kernel.org>
 <ZjgLAKlWC2HQzWfU@andrea>
 <mb61p4jb91zs1.fsf@kernel.org>
 <Zjqqu6RN1kRXw/WT@andrea>
 <mb61pttj8z9p9.fsf@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mb61pttj8z9p9.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_080448_287382_28847AA3 
X-CRM114-Status: GOOD (  18.36  )
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

> From my understanding of the current version of the RV memory model:
> 
> .aq provides .aq -> all ordering
> .rl provides all -> .rl ordering
> and because this is RCsc variant of release consistency
> .rl -> .aq
> 
> which means
> 
> R/W
> amoswap.w.rl
> amoswap.w.aq
> R/W
> 
> Should act as a full fence? R/W -> rl -> aq -> R/W

Yes, hence the RCsc ("sc" for "sequential consistent") qualification.


> So, I will do the following now:
> 
> 1. Do some benchmarking on real hardware and find out how much overhead
>    these weak fences add.
> 2. Study the LKMM and the RVWMO for the next few weeks/months or however
>    much time it takes me to confidently reason about things written in
>    these two models.
> 3. Study the locking / related code of RISC-V to see what could break if
>    we change all these operations in accordance with "Code Porting and
>    Mapping Guidelines" of RISCV ISA.
> 4. I will use the herd7 models of LKMM and RVWMO and see if everything
>    works as expected after these changes.
> 
> 
> And If I am convinced after all this, I will send a patch to implement
> "Code Porting and Mapping Guidelines" + provide performance numbers from
> real hardware.
> 
> Thanks for the detailed explainations and especially regarding how the
> LKMM evolved.

Sounds good!  Thanks.

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
