Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E237C4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Apr 2024 04:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1CX9lmaBit+9XRiqwFGb1AvE02wwVExlCEyXPbpOd2A=; b=pYnY+tdTUpINK6
	gQWh3RhlsAimAnvTvSUTGTnp0Uq9Q3j0mVzpdUV96VhyZQmNtq7jRYPCZgswObHccrICY+D9rKpHs
	nnlocLc8iUIXuHZHp2UOsSfIzDeEvDJF58H7hFX34aLDLd60S6rubrO7w3x7K8zKkcZLyvGmlPHOa
	eI8feZ81iCpK4wfgWXGgJn62KL9lLxNZQ89qlpMLhqHKDJXC0i3HKjSOqiqFUTja7SUGkzOWX43Zz
	CbFyrxrTsQXAKYOzX7w0JDfoKPD9qn+PcH+VXGx/WaKaKneAHhnJFg9UzyjnUkq/54s4Q+z63puZM
	Ol1QO3kJsUPWwF7kED5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwwrX-0000000Efds-04RL;
	Wed, 17 Apr 2024 04:25:35 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwwrR-0000000EfaY-3fQT
	for linux-riscv@lists.infradead.org;
	Wed, 17 Apr 2024 04:25:31 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3c70ef25e19so1542022b6e.3
        for <linux-riscv@lists.infradead.org>; Tue, 16 Apr 2024 21:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713327922; x=1713932722; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e2tZ+yG9t3/35QrGeru3QI9bqAmKuIVqOJ+PisGAvLA=;
        b=2CE+WbbaLP/5TRZ+hsFQO8051ZLho46xLqQVNutiyTm+MwlFMHxhGIup6HG0NqsQ14
         Z/s2eOgc4tunJDzjm5HsAY0oTU9BRT8DoNrwjXj3eYF5Ba+yJDD+lHBkNeFASVTFXEt2
         B4uLwkLt4pIn1Y36BAyGZN67h3hGx0cmL/CzwvGc2WLJ0fRg9tDBu5UpVR/1UXPAH0On
         yNyEy3y7DXssRxHQqVLCDk0ApJ5YhTMHwOS1JrJ8Cq1M+yCMr7WLEXU6I+nNydlO6ugF
         jkD+/5acUaOLNm8s8rJ7EOcdAk7nZ13jx5tMqDt5io4+s8ejw+fZz3Ehw4vQWOFopJy6
         SWtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713327922; x=1713932722;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e2tZ+yG9t3/35QrGeru3QI9bqAmKuIVqOJ+PisGAvLA=;
        b=PG2WHhbTV7C62XMojUjBBd4Ot07VEUi/iWkGcFkZrc5QUZ9gqLm302G8ITqAZjvGfA
         LPBUnSnt5htHfpLrFxzCJCNJ/Gm0zDbvIA0G9WDQtXnZD4Ll6zcVXG24X3AWLpKvgMqb
         tVPfJegtCrfPKKhp8q/CIE62QMrGlQRkEMIZTygKiTpacbnAPwnKPs45ld0loXohNayB
         X9DmFuIcpjqgNTl3o06IlyJM61eABWmprp8XQZzTkKcHkLwFIX0CCSiuB/I4BgHAMrfo
         4UZFr4Xtx8KZAlqKPM6v0Zr2mM1R6J+P5kqbjb2gWopCH5ox+75klHJLRB0ufZH+45LV
         SKTw==
X-Forwarded-Encrypted: i=1; AJvYcCWULlK14f2s/jANE10I4bXgTqfff3M4s9iX6z5fkGw0anxN1Y+diQItw7p9mNsD+zwxVJ8Hhg62istUG4QKPtmKUWxXi3lG4OwH863p8/2v
X-Gm-Message-State: AOJu0YzSt4dd0gHffkpVLcSlPehmo9PythgKWWtOuDNwfKYWZ01j/XHz
	KYRtaecNQWYDsRRr5obZZFD1mx6uYp1b1bbDeWoRHafVBPBtPltsyhZ2P4WWNzI=
X-Google-Smtp-Source: AGHT+IGWLA0NcQXbZEfFdR3YsDPfVHr118QZ4WjhomG+9rzHNhvOanaWIT94NHLW+jEwwRIrKftHvw==
X-Received: by 2002:a05:6808:298b:b0:3c5:f473:f35e with SMTP id ex11-20020a056808298b00b003c5f473f35emr16376428oib.12.1713327922458;
        Tue, 16 Apr 2024 21:25:22 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:6b78:3121:f067:eafa])
        by smtp.gmail.com with ESMTPSA id v29-20020aa799dd000000b006ea6f189976sm9733237pfi.163.2024.04.16.21.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 21:25:21 -0700 (PDT)
Date: Tue, 16 Apr 2024 21:25:18 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 02/19] riscv: cpufeature: Fix thead vector hwcap removal
Message-ID: <Zh9PLhUZmCF5mLXc@ghost>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-2-4af9815ec746@rivosinc.com>
 <20240412-tuesday-resident-d9d07e75463c@wendy>
 <ZhlrdGXfSushUNTp@ghost>
 <20240412-eastcoast-disparity-9c9e7d178df5@spud>
 <ZhmeLoPS+tsfqv1T@ghost>
 <20240412-chemist-haunt-0a30a8f280ca@spud>
 <ZhmoPuoR00aS6qZp@ghost>
 <20240413-sharper-unlivable-5a65660b19e2@spud>
 <Zh3xrTfjjk3b4GHb@ghost>
 <20240416-husband-flavored-96c1dad58b6e@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240416-husband-flavored-96c1dad58b6e@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_212530_032647_5A9BABDB 
X-CRM114-Status: GOOD (  67.34  )
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

On Tue, Apr 16, 2024 at 08:36:33AM +0100, Conor Dooley wrote:
> On Mon, Apr 15, 2024 at 08:34:05PM -0700, Charlie Jenkins wrote:
> > On Sat, Apr 13, 2024 at 12:40:26AM +0100, Conor Dooley wrote:
> > > On Fri, Apr 12, 2024 at 02:31:42PM -0700, Charlie Jenkins wrote:
> > > > On Fri, Apr 12, 2024 at 10:27:47PM +0100, Conor Dooley wrote:
> > > > > On Fri, Apr 12, 2024 at 01:48:46PM -0700, Charlie Jenkins wrote:
> > > > > > On Fri, Apr 12, 2024 at 07:47:48PM +0100, Conor Dooley wrote:
> > > > > > > On Fri, Apr 12, 2024 at 10:12:20AM -0700, Charlie Jenkins wrote:
> > > 
> > > > > > > > This is already falling back on the boot CPU, but that is not a solution
> > > > > > > > that scales. Even though all systems currently have homogenous
> > > > > > > > marchid/mvendorid I am hesitant to assert that all systems are
> > > > > > > > homogenous without providing an option to override this.
> > > > > > > 
> > > > > > > There are already is an option. Use the non-deprecated property in your
> > > > > > > new system for describing what extesions you support. We don't need to
> > > > > > > add any more properties (for now at least).
> > > > > > 
> > > > > > The issue is that it is not possible to know which vendor extensions are
> > > > > > associated with a vendor. That requires a global namespace where each
> > > > > > extension can be looked up in a table. I have opted to have a
> > > > > > vendor-specific namespace so that vendors don't have to worry about
> > > > > > stepping on other vendor's toes (or the other way around). In order to
> > > > > > support that, the vendorid of the hart needs to be known prior.
> > > > > 
> > > > > Nah, I think you're mixing up something like hwprobe and having
> > > > > namespaces there with needing namespacing on the devicetree probing side
> > > > > too. You don't need any vendor namespacing, it's perfectly fine (IMO)
> > > > > for a vendor to implement someone else's extension and I think we should
> > > > > allow probing any vendors extension on any CPU.
> > > > 
> > > > I am not mixing it up. Sure a vendor can implement somebody else's
> > > > extension, they just need to add it to their namespace too.
> > > 
> > > I didn't mean that you were mixing up how your implementation worked, my
> > > point was that you're mixing up the hwprobe stuff which may need
> > > namespacing for $a{b,p}i_reason and probing from DT which does not.
> > > I don't think that the kernel should need to be changed at all if
> > > someone shows up and implements another vendor's extension - we already
> > > have far too many kernel changes required to display support for
> > > extensions and I don't welcome potential for more.
> > 
> > Yes I understand where you are coming from. We do not want it to require
> > very many changes to add an extension. With this framework, there are
> > the same number of changes to add a vendor extension as there is to add
> > a standard extension. 
> 
> No, it is actually subtly different. Even if the kernel already supports
> the extension, it needs to be patched for each vendor
> 
> > There is the upfront cost of creating the struct
> > for the first vendor extension from a vendor, but after that the
> > extension only needs to be added to the associated vendor's file (I am
> > extracting this out to a vendor file in the next version). This is also
> > a very easy task since the fields from a different vendor can be copied
> > and adapted.
> > 
> > > Another thing I just thought of was systems where the SoC vendor
> > > implements some extension that gets communicated in the ISA string but
> > > is not the vendor in mvendorid in their various CPUs. I wouldn't want to
> > > see several different entries in structs (or several different hwprobe
> > > keys, but that's another story) for this situation because you're only
> > > allowing probing what's in the struct matching the vendorid.
> > 
> > Since the isa string is a per-hart field, the vendor associated with the
> > hart will be used.
> 
> I don't know if you just didn't really read what I said or didn't
> understand it, but this response doesn't address my comment.

I read what you said! This question seemed to me as another variant of
"what happens when one vendor implements an extension from a different
vendor", and since we already discussed that I was trying to figure out
what you were actually asking.

> Consider SoC vendor S buys CPUs from vendors A & B and asks both of them
> to implement Xsjam. The CPUs are have the vendorid of either A or B,
> depending on who made it. This scenario should not result in two
> different hwprobe keys nor two different in-kernel riscv_has_vendor_ext()
> checks to see if the extension is supported. *If* the extension is vendor
> namespaced, it should be to the SoC vendor whose extension it is, not
> the individual CPU vendors that implemented it.
> 
> Additionally, consider that CPUs from both vendors are in the same SoC
> and all CPUs support Xsjam. Linux only supports homogeneous extensions
> so we should be able to detect that all CPUs support the extension and
> use it in a driver etc, but that's either not going to work (or be
> difficult to orchestrate) with different mappings per CPU vendor. I saw
> your v2 cover letter, in which you said:
>   Only patch vendor extension if all harts are associated with the same
>   vendor. This is the best chance the kernel has for working properly if
>   there are multiple vendors.
> I don't think that level of paranoia is required: if firmware tells us
> that an extension is supported, then we can trust that those extensions
> have been implemented correctly. If the fear of implementation bugs is
> what is driving the namespacing that you've gone for, I don't think that
> it is required and we can simplify things, with the per-vendor structs
> being the vendor of the extension (so SoC vendor S in my example), not
> A and B who are the vendors of the CPU IP.
> 
> Thanks,
> Conor.
> 

Thank you for expanding upon this idea further. This solution of
indexing the extensions based on the vendor who proposed them does make
a lot of sense. There are some key differences here of note. When
vendors are able to mix vendor extensions, defining a bitmask that
contains all of the vendor extensions gets a bit messier. I see two
possible solutions.

1. Vendor keys cannot overlap between vendors. A set bit in the bitmask
is associated with exactly one extension.

2. Vendor keys can overlap between vendors. There is a vendor bitmask
per vendor. When setting/checking a vendor extension, first index into
the vendor extension bitmask with the vendor associated with the
extension and then with the key of the vendor extension.

A third option would be to use the standard extension framework. This
causes the standard extension list to become populated with extensions
that most harts will never implement so I am opposed to that.

This problem carries over into hwprobe since the schemes proposed by
Evan and I both rely on the mvendorid of harts associated with the
cpumask. To have this level of support in hwprobe for SoCs with a mix of
vendors but the same extensions I again see two options:

1. Vendor keys cannot overlap between vendors. A set bit in the bitmask
is associated with exactly one extension. This bitmask would be returned
by the vendor extension hwprobe key.

2. Vendor keys can overlap between vendors. There is an hwprobe key per
vendor. Automatic resolution of the vendor doesn't work because the
vendor-specific feature being requested (extensions in the case) may be
of a vendor that is different than the hart's vendor, in otherwords
there are two variables necessary: the vendor and a way to ask hwprobe
for a list of the vendor extensions. With hwprobe there is only the
"key" that can be used to encode these variables simultaneously. We
could have something like a HWPROBE_THEAD_EXT_0 key that would return
all thead vendor extensions supported by the harts corresponding to the
cpumask.

I didn't list the option that we shove all of the vendor extensions into
the same fields that are used for standard extensions because that will
fill up the standard extension probing with all of the vendor extensions
that most SoCs will not care about.

The second option for hwprobe is nice because there are "only" 64 values
supported in the returned bitmask so if there ends up being a lot of
vendor extensions that need to be exposed, then we would end up with a
lot of unused bits on most systems.

For the internal kernel structures it matters less (or doesn't matter at
all) since it's not exposed to userspace and it can always change.
Having consistency is nice for developers though so it would be my
preference to have schemes that reflect each other for the in-kernel
structures and hwprobe.

Thank you for working this problem out with me. I know there is a lot of
text I am pushing here, hopefully we can design something that doesn't
need to be re-written in the future.

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
