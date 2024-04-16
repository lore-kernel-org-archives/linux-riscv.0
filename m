Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E02C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 03:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=93b48vuehP4JE/HVYotRAXc5DGSSnrVRIhppc1fk5j8=; b=hNDximVXDoFObL
	X/sKdeAR1Z/L5fWlg1v9iji9yXscjmy+tExT3D+jRjkreNv5k+ZF+RrxX1BAsfGrxmnOgSf9eu0Ou
	ORDeY8D0X7/YIoAnw+4DWsyvol4l8xztoq6aazpgwzj1AxYGUHjBqKOFRoM3oH3XFqg1IRSk6+EiC
	laoLEZbgT09tW9vhUQ/39GNUyeCyO2G2l95Lwy0aG1KI6rAlfW4+e4sMTF3oVCK2ERqUp6WNi5VMr
	o3W8vc0Muqo7r7IsJWjBTlE2W3nfmGlkzvwxzmWE44GkZ+xaQQeX/560IQ4/xe41jWxcFhGWbfpSz
	pR+ZMixKeVFxl2vztTYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwZaI-0000000Ag6D-1M43;
	Tue, 16 Apr 2024 03:34:14 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwZaE-0000000Ag4r-0yHa
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 03:34:12 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6eced6fd98aso3582854b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 20:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713238448; x=1713843248; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+EWmrrioxcbdhmgLzVDWs0ZmfxosK3ySncICyoT9RVM=;
        b=t6xXIrm/gd4jP9vhV3B5tT02l46HhTyzTIG1KIKg6AP3PvRkYC2eBKRUKwA+jRouXe
         S663zoPnvUnwJ6xadxV4f8ch7bwWoTOCHfzQ1uAerxDxxsuvSn/EojuSCifNHH8dcXfh
         2w5dl9G73ylCtnnKxZdmsa8AcnHTKvpY4/D5Q4KkffYuPfwY/Z34FBnPE4qWPxkjJdTG
         aHHmTXj316Bf8DsEoGVg7VCG/lIBF/WOlD2v8tQQ/+S7nhpnGgcLyUZHymyjmKUXSP8F
         KPJ5C67kwgThTWIyLBez/2GGJXYND5m2qo+ZEoppUHfkLUXZWcYQc2RBUNSNPGM1D6aC
         nBVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713238448; x=1713843248;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+EWmrrioxcbdhmgLzVDWs0ZmfxosK3ySncICyoT9RVM=;
        b=guGSoPcR3arlvO5ve9KEIue0hMSzBc9VAxMLPZ/dJIkoIL+q05y1JXCG8KHu74r/es
         FOnyqvR19sRTZxNYuGu/xTSI8R3/iwEyaGACo5zZhuksP2RfUIblTLvzIyzPsDOaQ8u9
         9dHosu2NkROo8zWqTduu0PSnTMUw1Gy+pHU7HltAixM9si0Q68252Z70TiJqCNmWSS9S
         IKFhNmvnT8xBj0/RdPd66lDCqaLBhV4Bz7H5DvUrEaqaUTllKz74cr1twvOJaFSQwZYR
         jeXv7lTGbYVfAsLZjNbk9IVdrO965+ihmslLTDvCKpIUT0FfhC0ioAQgWfeUoic7UiQi
         vV2A==
X-Forwarded-Encrypted: i=1; AJvYcCWFeIOPYwj52AwHcoIWmbv+nvEuLsmnuqOpUZAGBXsor5f/+hiPUP25J0bv74zWhpcYBf2WWi6xq2D124aYbEtYWKcCeUw11NDKz6AOh3gh
X-Gm-Message-State: AOJu0Yy4j5uYEaTBZmqa9aBIEfn+SjlxoITNixPndjZWLEtrOuX4wN0Q
	J7owSljcl1Hp2wdOn93E7k0dRmYSjFkwfxqy0tWCfhqt4t8IL9aig601trc2Ns8=
X-Google-Smtp-Source: AGHT+IG9jfOvCmqHl4/Fyo/8q6SyIRFlYI9sihLFkiHMi13PEhJw0HyUWWTm9jC0FXv9X1osScl9nA==
X-Received: by 2002:a05:6a21:8889:b0:1a5:bc5d:3c0a with SMTP id tb9-20020a056a21888900b001a5bc5d3c0amr15476979pzc.61.1713238448517;
        Mon, 15 Apr 2024 20:34:08 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:fd:b04f:bfdd:b666])
        by smtp.gmail.com with ESMTPSA id i15-20020a170902c94f00b001e25da6f2f2sm8653509pla.68.2024.04.15.20.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 20:34:08 -0700 (PDT)
Date: Mon, 15 Apr 2024 20:34:05 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
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
Message-ID: <Zh3xrTfjjk3b4GHb@ghost>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-2-4af9815ec746@rivosinc.com>
 <20240412-tuesday-resident-d9d07e75463c@wendy>
 <ZhlrdGXfSushUNTp@ghost>
 <20240412-eastcoast-disparity-9c9e7d178df5@spud>
 <ZhmeLoPS+tsfqv1T@ghost>
 <20240412-chemist-haunt-0a30a8f280ca@spud>
 <ZhmoPuoR00aS6qZp@ghost>
 <20240413-sharper-unlivable-5a65660b19e2@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240413-sharper-unlivable-5a65660b19e2@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_203410_427883_62CA88C3 
X-CRM114-Status: GOOD (  35.75  )
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

On Sat, Apr 13, 2024 at 12:40:26AM +0100, Conor Dooley wrote:
> On Fri, Apr 12, 2024 at 02:31:42PM -0700, Charlie Jenkins wrote:
> > On Fri, Apr 12, 2024 at 10:27:47PM +0100, Conor Dooley wrote:
> > > On Fri, Apr 12, 2024 at 01:48:46PM -0700, Charlie Jenkins wrote:
> > > > On Fri, Apr 12, 2024 at 07:47:48PM +0100, Conor Dooley wrote:
> > > > > On Fri, Apr 12, 2024 at 10:12:20AM -0700, Charlie Jenkins wrote:
> 
> > > > > > This is already falling back on the boot CPU, but that is not a solution
> > > > > > that scales. Even though all systems currently have homogenous
> > > > > > marchid/mvendorid I am hesitant to assert that all systems are
> > > > > > homogenous without providing an option to override this.
> > > > > 
> > > > > There are already is an option. Use the non-deprecated property in your
> > > > > new system for describing what extesions you support. We don't need to
> > > > > add any more properties (for now at least).
> > > > 
> > > > The issue is that it is not possible to know which vendor extensions are
> > > > associated with a vendor. That requires a global namespace where each
> > > > extension can be looked up in a table. I have opted to have a
> > > > vendor-specific namespace so that vendors don't have to worry about
> > > > stepping on other vendor's toes (or the other way around). In order to
> > > > support that, the vendorid of the hart needs to be known prior.
> > > 
> > > Nah, I think you're mixing up something like hwprobe and having
> > > namespaces there with needing namespacing on the devicetree probing side
> > > too. You don't need any vendor namespacing, it's perfectly fine (IMO)
> > > for a vendor to implement someone else's extension and I think we should
> > > allow probing any vendors extension on any CPU.
> > 
> > I am not mixing it up. Sure a vendor can implement somebody else's
> > extension, they just need to add it to their namespace too.
> 
> I didn't mean that you were mixing up how your implementation worked, my
> point was that you're mixing up the hwprobe stuff which may need
> namespacing for $a{b,p}i_reason and probing from DT which does not.
> I don't think that the kernel should need to be changed at all if
> someone shows up and implements another vendor's extension - we already
> have far too many kernel changes required to display support for
> extensions and I don't welcome potential for more.

Yes I understand where you are coming from. We do not want it to require
very many changes to add an extension. With this framework, there are
the same number of changes to add a vendor extension as there is to add
a standard extension. There is the upfront cost of creating the struct
for the first vendor extension from a vendor, but after that the
extension only needs to be added to the associated vendor's file (I am
extracting this out to a vendor file in the next version). This is also
a very easy task since the fields from a different vendor can be copied
and adapted.

> 
> Another thing I just thought of was systems where the SoC vendor
> implements some extension that gets communicated in the ISA string but
> is not the vendor in mvendorid in their various CPUs. I wouldn't want to
> see several different entries in structs (or several different hwprobe
> keys, but that's another story) for this situation because you're only
> allowing probing what's in the struct matching the vendorid.

Since the isa string is a per-hart field, the vendor associated with the
hart will be used.

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
