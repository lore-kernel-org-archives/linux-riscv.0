Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A2EEB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 17:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VvKk0xD9SNvPWgv1vRmeyj8JVqI6sh/s3XjvI19qD6o=; b=ESMsPqxlyYXY1E
	9jRHMVjV+aW1BQzI1u6XRC/YJvTfIEndx0ZMoykkA/XPAocUxPU/2tl/m/CVLykTuiSJrT867GZvN
	S59f5F05H+QCGH4rQZzPq6cqEe0S3Lu71t01mR6KeZE/LvSSWlwCTVU7BvvthhLncHos9DIKS602x
	omSy45Aw9S4IAPUTRUb2NjcnhLfCKrc4EokWx6Xv/BoJTREctr96npkfx6TlLr558wGJcEwtOqx2P
	o0GvioW/YKG2/Osn8Y+jjFG6pBDcVRlNZQ7rKD/TijfzMa51YofZh5jY2JovAeorRoIFBP07GTdr7
	jvq8xbqV3F0F10hhyLmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDpgS-00Ahow-10;
	Mon, 26 Jun 2023 17:07:24 +0000
Received: from mail-io1-f44.google.com ([209.85.166.44])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDpgP-00AhoV-0z
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 17:07:23 +0000
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-783698a37beso23291839f.0
        for <linux-riscv@lists.infradead.org>; Mon, 26 Jun 2023 10:07:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687799240; x=1690391240;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4R+rlufSGz/F2JIo7VcyU36DYxyYKPvMUd0AGJe/g5E=;
        b=iK4p1+PYv4O2B24G5L+AJKaNvo4hbP1IEGW9rnTn/QES0CZ9fp5WNRG+2ziVkjXgJ9
         ePx4D4nnXwI7qrAPaIxSbuM/qR6YjE6sQfmsk7KG08HWfqy65p5kCpPlEyVM8J0cC+lS
         E4AK/sPys9339iTYkXv1HXZPq3gsZS7URUxBcgS5zd0L6P75vunhrbBNz2O1NcLNZhfB
         KP1DG4IAjAlIbk5cWSmIpunRQUuppguctKNiwUzRYpZEAHYWBfcEK79Iowuitjb3wHwD
         t75w6PnoRUmu+RVfLltglRrAScLdHQUn2FqN8QObR/ka6tQKrENZNyoIIT9Se+Q4T8m1
         +6WQ==
X-Gm-Message-State: AC+VfDxZNkBfjR8g2WqgcDUpXUAvTm0FicFOnyFpL4j47YfeNEGJsDg2
	NhohjcEhtcEtJXVk1V03gYHYokO5WQ==
X-Google-Smtp-Source: ACHHUZ6F6azxDsAdEVNZRMuQDFsJqEvja5LhkIHoFhNQcTE9cAwQTuGNtHwyJksq1Lysjy50hLmNuA==
X-Received: by 2002:a6b:e903:0:b0:783:62a8:854f with SMTP id u3-20020a6be903000000b0078362a8854fmr2738656iof.3.1687799239975;
        Mon, 26 Jun 2023 10:07:19 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id a22-20020a5d9ed6000000b0077e3566a801sm2318281ioe.29.2023.06.26.10.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 10:07:19 -0700 (PDT)
Received: (nullmailer pid 3403295 invoked by uid 1000);
	Mon, 26 Jun 2023 17:07:16 -0000
Date: Mon, 26 Jun 2023 11:07:16 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Alistair Francis <alistair.francis@wdc.com>, Anup Patel <apatel@ventanamicro.com>, conor@kernel.org, u-boot@lists.denx.de, linux-kernel@vger.kernel.org, palmer@dabbelt.com, Leo <ycliang@andestech.com>, Palmer Dabbelt <palmer@rivosinc.com>, Rob Herring <robh+dt@kernel.org>, Jessica Clarke <jrtc27@jrtc27.com>, Oleksii <oleksii.kurochko@gmail.com>, Rick Chen <rick@andestech.com>, Paul Walmsley <paul.walmsley@sifive.com>, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, qemu-riscv@nongnu.org
Subject: Re: [PATCH v3] dt-bindings: riscv: deprecate riscv,isa
Message-ID: <168779923643.3403238.2898272674301984496.robh@kernel.org>
References: <20230626-unmarked-atom-70b4d624a386@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230626-unmarked-atom-70b4d624a386@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_100721_385133_F2ABD8CF 
X-CRM114-Status: GOOD (  48.38  )
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


On Mon, 26 Jun 2023 11:10:46 +0100, Conor Dooley wrote:
> intro
> =====
> 
> When the RISC-V dt-bindings were accepted upstream in Linux, the base
> ISA etc had yet to be ratified. By the ratification of the base ISA,
> incompatible changes had snuck into the specifications - for example the
> Zicsr and Zifencei extensions were spun out of the base ISA.
> 
> Fast forward to today, and the reason for this patch.
> Currently the riscv,isa dt property permits only a specific subset of
> the ISA string - in particular it excludes version numbering.
> With the current constraints, it is not possible to discern whether
> "rv64i" means that the hart supports the fence.i instruction, for
> example.
> Future systems may choose to implement their own instruction fencing,
> perhaps using a vendor extension, or they may not implement the optional
> counter extensions. Software needs a way to determine this.
> 
> versioning schemes
> ==================
> 
> "Use the extension versions that are described in the ISA manual" you
> may say, and it's not like this has not been considered.
> Firstly, software that parses the riscv,isa property at runtime will
> need to contain a lookup table of some sort that maps arbitrary versions
> to versions it understands. There is not a consistent application of
> version number applied to extensions, with a higgledy-piggledy
> collection of tags, "bare" and versioned documents awaiting the reader
> on the "recently ratified extensions" page:
> https://wiki.riscv.org/display/HOME/Recently+Ratified+Extensions
> 
> 	As an aside, and this is reflected in the patch too, since many
> 	extensions have yet to appear in a release of the ISA specs,
> 	they are defined by commits in their respective "working draft"
> 	repositories.
> 
> Secondly, there is an issue of backwards compatibility, whereby allowing
> numbers in the ISA string, some parsers may be broken. This would
> require an additional property to be created to even use the versions in
> this manner.
> 
> ~boolean properties~ string array property
> ==========================================
> 
> If a new property is needed, the whole approach may as well be looked at
> from the bottom up. A string with limited character choices etc is
> hardly the best approach for communicating extension information to
> software.
> 
> Switching to using properties that are defined on a per extension basis,
> allows us to define explicit meanings for the DT representation of each
> extension - rather than the current situation where different operating
> systems or other bits of software may impart different meanings to
> characters in the string.
> Clearly the best source of meanings is the specifications themselves,
> this just provides us the ability to choose at what point in time the
> meaning is set. If an extension changes incompatibility in the future,
> a new property will be required.
> 
> Off-list, some of the RVI folks have committed to shoring up the wording
> in either the ISA specifications, the riscv-isa-manual or
> so that in the future, modifications to and additions or removals of
> features will require a new extension. Codifying that assertion
> somewhere would make it quite unlikely that compatibility would be
> broken, but we have the tools required to deal with it, if & when it
> crops up.
> It is in our collective interest, as consumers of extension meanings, to
> define a scheme that enforces compatibility.
> 
> The use of individual properties, rather than elements in a single
> string, will also permit validation that the properties have a meaning,
> as well as potentially reject mutually exclusive combinations, or
> enforce dependencies between extensions. That would not have be possible
> with the current dt-schema infrastructure for arbitrary strings, as we
> would need to add a riscv,isa parser to dt-validate!
> That's not implemented in this patch, but rather left as future work (for
> the brave, or the foolish).
> 
> acpi
> ====
> 
> The current ACPI ECR is based on having a single ISA string unfortunately,
> but ideally ACPI will move to another method, perhaps GUIDs, that give
> explicit meaning to extensions.
> 
> parser simplicity
> =================
> 
> Many systems that parse DT at runtime already implement an function that
> can check for the presence of a string in an array of string, as it is
> similar to the process for parsing a list of compatible strings, so a
> bunch of new, custom, DT parsing should not be needed.
> Getting rid of "riscv,isa" parsing would be a nice simplification, but
> unfortunately for backwards compatibility with old dtbs, existing
> parsers may not be removable - which may greatly simplify
> dt parsing code. In Linux, for example, checking for whether a hart
> supports an extension becomes as simple as:
> 	of_property_match_string(node, "riscv,isa-extensions", "zicbom")
> 
> vendor extensions
> =================
> 
> Compared to riscv,isa, this proposed scheme promotes vendor extensions,
> oft touted as the strength of RISC-V, to first-class citizens.
> At present, extensions are defined as meaning what the RISC-V ISA
> specifications say they do. There is no realistic way of using that
> interface to provide cross-platform definitions for what vendor
> extensions mean. Vendor extensions may also have even less consistency
> than RVI do in terms of versioning, or no care about backwards
> compatibility.
> The new property allows us to assign explicit meanings on a per vendor
> extension basis, backed up by a description of their meanings.
> 
> fin
> ===
> 
> Create a new file to store the extension meanings and a new
> riscv,isa-base property to replace the aspect of riscv,isa that is
> not represented by the new property - the base ISA implemented by a hart.
> 
> As a starting point, add properties for extensions currently used in
> Linux.
> 
> Finally, mark riscv,isa as deprecated, as removing support for it in
> existing programs would be an ABI break.
> 
> CC: Palmer Dabbelt <palmer@dabbelt.com>
> CC: Paul Walmsley <paul.walmsley@sifive.com>
> CC: Rob Herring <robh+dt@kernel.org>
> CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> CC: Alistair Francis <alistair.francis@wdc.com>
> CC: Andrew Jones <ajones@ventanamicro.com>
> CC: Anup Patel <apatel@ventanamicro.com>
> CC: Atish Patra <atishp@atishpatra.org>
> CC: Jessica Clarke <jrtc27@jrtc27.com>
> CC: Rick Chen <rick@andestech.com>
> CC: Leo <ycliang@andestech.com>
> CC: Oleksii <oleksii.kurochko@gmail.com>
> CC: linux-riscv@lists.infradead.org
> CC: qemu-riscv@nongnu.org
> CC: u-boot@lists.denx.de
> CC: devicetree@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Changes in v3:
> - Per Rob's suggestion, switch to an array of strings. Cuts down on the
>   size, compared to booleans. It has a standard mechanism for parsing
>   (you need to parse arrays of strings for compatibles). It still allows
>   for having a limited set of explicitly defined properties - so the
>   advantages over a free-form string still apply.
> - Pick up Palmer's Ack and Review (although I expect that he will be the
>   one to apply this).
> ---
>  .../devicetree/bindings/riscv/cpus.yaml       |  43 ++-
>  .../devicetree/bindings/riscv/extensions.yaml | 245 ++++++++++++++++++
>  2 files changed, 265 insertions(+), 23 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/riscv/extensions.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
