Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8996C25B48
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Oct 2023 18:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tlUBXljhCLR5CgGtxUkexEika3kR4fF2Gqs0T9/6V1E=; b=kS8fGjL/9r49lX
	tbJvw1btBERRQUK1tmAC+mPQ5ikxdbf859VOp/gyyjejod1I5jsSao8jk5CxSCdsHEySuwxVTf5XX
	pBRZCQv85pbJJNsHB0A2LzTPEguppF9CcWSJVYDKT3NMJoGa6XTUL9UJ5k4cY3IfawcTkdQf2GlEh
	l4ko5oMscU2MCaLMIoCaY1R2pr8Yjix6Eg1/qvlw1BTKIZS+rP+SUZv03MkoNA38UqGq4RWD4MXgA
	1SLr5S94mhLq3N4Gs54HT+K5IIeLOGgUbbFzvqsqbEE3TH9alMD9QL8ym0xuy2FMhiBvUQ8JvUBV0
	Re2H2dK4gtBJytueQIKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwS2E-00H3BE-37;
	Fri, 27 Oct 2023 18:58:18 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwS2B-00H3Aa-17
	for linux-riscv@lists.infradead.org;
	Fri, 27 Oct 2023 18:58:17 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6b6f4c118b7so2398783b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 27 Oct 2023 11:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698433093; x=1699037893; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=io60u5zI7m0Nkr3gj8hgI941efp/GEK5u/DAlokh5+w=;
        b=FsnyqAtOBVt91+IsyZzETj2qhGuiXtNJDtxYzSJxl/nvlKEmDFQofP580lrBFcCB98
         ebCBG4jASNPYKhizw7D5DnhnJS7MAB7KndYvrv85GfGymvU8dRFfVROW6g0imM5vdrOm
         aa6H9GcChCE1XIZ4D6cYK3Gm/HfQ+S8eStTHN8kYx2rR26LRDjYv8/7gDdzcnU39n0lp
         Q0vtDrrMsiEDPdtxcUkR7mu6scuyk7XZq6vz2zZQ7HV1UIUU3DPA0T8lNpXYoHKXQPFC
         T9yjyEkUqrpmLsGcZhp9bUGdJh8AC1IeOs/se5Xyg0YXhe3Bo8c67qhebORbvUk78d9a
         /x7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698433093; x=1699037893;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=io60u5zI7m0Nkr3gj8hgI941efp/GEK5u/DAlokh5+w=;
        b=bgkdW5uwXfgJ9vRV0NDzYFmexJUPQ157hjajhUnhQn+Wmq0mhxVCRawuBAliGDiKYW
         dr6gN3zC7KSBl3EG74+TWL1v+lhAWbp3vRSZYqxVgb2qL3e5O/qj6iPPPOmaleatsIl2
         IbmEXw7d1ugzqbKM9weAwFKM5As17pj3uBE2OGJtJANeEerTysURfyhgtmw0sAf9g0wq
         iAix2cQGKMboNC4n7aa3nDTy9p8nDbVrioVLWQ4ul+gejGl/9DaMNOl+oAHj9oRP7leR
         wRnwDU1vp5x2iwHmmdMdiyDdTispG0FECKfLP2bmtdqGjQswgljSk/TngOqLf/C0/8oP
         6tmw==
X-Gm-Message-State: AOJu0YyipaIUmDK6BM/LQCH8DpF89ladxoMEWwignFZrhw6vbXJ96o1b
	MrrovS6MdsGM/OnVKPWUEY0ztqDZ+xZi6XBXfgU=
X-Google-Smtp-Source: AGHT+IGCPLUCPTvK3wDC4poaY6S2aDztJvRixDKQ94OoXzFXeb/m2AdASuHwWgsRzq03EKYBlvHTkQ==
X-Received: by 2002:a05:6a20:a206:b0:174:d189:2f93 with SMTP id u6-20020a056a20a20600b00174d1892f93mr3078602pzk.59.1698433092818;
        Fri, 27 Oct 2023 11:58:12 -0700 (PDT)
Received: from ghost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id s11-20020a056a00178b00b006bc3e8f58besm1728698pfg.56.2023.10.27.11.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 11:58:12 -0700 (PDT)
Date: Fri, 27 Oct 2023 11:58:10 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Jessica Clarke <jrtc27@jrtc27.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC] riscv: Script to autogenerate instruction handling code
Message-ID: <ZTwIQsJh0VWyAn61@ghost>
References: <ZRD8RzBeA2RMrcki@ghost>
 <20231023-aa3f789ccb483afbbdd55b38@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231023-aa3f789ccb483afbbdd55b38@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_115815_610593_368B762D 
X-CRM114-Status: GOOD (  43.98  )
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

On Mon, Oct 23, 2023 at 11:19:23AM +0200, Andrew Jones wrote:
> On Sun, Sep 24, 2023 at 08:19:35PM -0700, Charlie Jenkins wrote:
> > I have heeded Andrew Jones' advice and written a script to generate the
> > instruction handling code. It is still in development, but currently
> > lives on a fork of riscv-opcodes [1]. I am interested if what I have
> > produced so far is in line with what people would want to see.
> 
> Hi Charlie,
> 
> Sorry for my slow response. I'm glad to see that we're going in a
> direction where we generate these functions and reuse an existing
> generator to do it.
> 
> > 
> > An insn.h file can be generated by running the following in the repo:
> > 
> > make
> > python3 parse_linux.py instr_dict.yaml insn.h opcodes_config variable_field_data.yaml
> > 
> > I have pushed the generated files to the repo so people do not need to
> > run the script.
> 
> I couldn't find the generated files, not even [3] from your references
> seems to be present.
> 

I somehow deleted the files... I have added them back:
https://github.com/charlie-rivos/riscv-opcodes/blob/linux_parsing/insn.h
https://github.com/charlie-rivos/riscv-opcodes/blob/linux_parsing/opcodes_config

> > 
> > Each instruction has "variable fields" such as registers and immediates.
> > For each variable field that appears in any provided instruction 3 functions
> > are provided: extract a variable field from an instruction, insert a value into
> > a variable field of an instruction, update a value into a variable field of an
> > instruction. Update first clears the previous value of the variable field of the
> > instruction. Then for each instruction, the script generates a function to check if an
> > arbitrary 32-bit value matches the given instruction, and a function to
> > generate the binary for the instruction given the required variable
> > fields.
> > 
> > I was able to use riscv-opcodes to parse the instruction files, but
> > needed to create a new data structure in variable_field_data.py [2] which
> > holds the positioning of immediates inside of an instruction.
> > 
> > I envision that opcodes_config [3] would live inside of the kernel alongside
> > a simple script to call riscv-opcodes (that resides somewhere in the
> > user's file system) with appropriate parameters. When somebody wants to
> > add a new instruction, they can add an instruction to opcodes_config,
> > run the script, and commit the resulting generated file.
> 
> That sounds good to me. (They may hand craft the functions for a single
> instruction too, by just using the other functions as templates, but even
> if the script isn't used all the time in the future, the initial
> conversion of many instructions makes it worth while, IMO.)
> 
> > 
> > If this script is in a direction that people like, I will continue to
> > fix up the issues in it and try to get it upstreamed to riscv-opcodes
> > before I send a kernel patch.
> 
> Please send me a pointer to opcodes_config and insn.h. Also, since you're
> extending riscv-opcodes with variable_field_data.py, have you found a way
> to verify that all the immediate offsets are correct? Or were the offsets
> extracted from the spec/tool directly somehow? I.e. was
> variable_field_data.py mostly generated itself?
> 
> Thanks,
> drew

No, they were hand-coded unfortunately. riscv-opcodes invented a whole
bunch of names for different styles of immediates. How I did it manually
was find an instruction that used that immediate type, then go to the
spec and figure out the bounds of the immediate. There are some further
complications like some immediates can't be specific value (normally 0)
and some immediates are split. I don't think it's worth the effort to
auto-generate that.

Recently I have been distracted from this, but I have re-evaluated this.
I believe it might be better to not store the Linux parsing scripts
directly in riscv-opcodes, but rather generalize the scripts in
riscv-opcodes and provide it as a Python package. I have a prototype of
this working, but it is still a work in progress. I would like to avoid
using the parse script already in riscv-opcodes so the python package can
be fully contained inside of the repo, and the parse script can remain
separate. However, there are some features I would like to add to the
parsing so I would need to add those features to parse.py first.

- Charlie

> 
> > 
> > - Charlie
> > 
> > [1] https://github.com/charlie-rivos/riscv-opcodes/tree/linux_parsing
> > [2] https://github.com/charlie-rivos/riscv-opcodes/blob/linux_parsing/variable_field_data.py
> > [3] https://github.com/charlie-rivos/riscv-opcodes/blob/linux_parsing/opcodes_config

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
