Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6508C5CFC1
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 09:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6FFOJLYz4iyC0RHoJBQu+LmmfnL/qtYZaCMOpFd4Bqg=; b=znQ4nkjt1kIJFV
	8fgdQaIGU4ZB+JliR4OtkjoeBt1iqNh0Qfc+0tpIkAz/UsB12mdoMdUrKidgVfaV9HL9RWoaz+NQF
	n1VmFyAAD4OGk3750OCpGZUsFvfYtd6ZGpaSL5wSeN5uHCzFR7/KdaUSmDFczsIFZLEHJNXOlv7fJ
	nXkXLATtWFetcsrtv1C7ohQslUAvOSELTQB07fgCxZIzR1D/+FOMHpd+3/bEmX9mJkmt9J/kRzfLV
	xDWGESeX/nPfDwuL5hfGMpWePBZnyLQIyISv8mBBD1zLpGtW/OdonLqS/ErQ9exfCoEtJ3Ud/VBzv
	Bj1SPmXCxKudxWTnZLiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtiqA-0000000Dkla-2Zz0;
	Tue, 11 Aug 2026 09:32:10 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtiq8-0000000DklC-0miG
	for linux-riscv@lists.infradead.org;
	Tue, 11 Aug 2026 09:32:09 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2caced6038eso9404715ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 11 Aug 2026 02:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1786440727; x=1787045527; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ap29SzIYC2SRhT7+1cYIYqMqPmmcLkWivyt8GCYG80w=;
        b=fFoF+6IzMMj0NSH6gsf02SO0CePX/Q9mTWEsg6mL1w9Tlu3EpyfbD/LxjiiDg4Q83p
         aNPUrcwTz5fn0dBv77pzrHq3BTiIfQNr/OXcIx0H3QmcXT+OVyHM5cfDKdklkGoOI8uy
         vGiWXF/N+gJ1L+jLNHfcrVbLzxPNgE8Y/KhWbe//1+UtNUNxup0ZCfzE/5Z9WtNMq/15
         jF3m56ZqnrksOXYppcx9fMMrRae0Oz7BnzG14S7aLbkAvXVks0/3y+cDQ6nBJwrdzoxu
         pF1yHJW746R7U5EJbbpUsMKUzMDCpnv3KUCmg+DwtJBPTnoQ5lCBf08n7AiUh+UBAUh8
         wkhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786440727; x=1787045527;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ap29SzIYC2SRhT7+1cYIYqMqPmmcLkWivyt8GCYG80w=;
        b=rD/VpEuoY1FouJGADwyTFWW5XWf2FmF992qlf/4eDSkzg9cK2CuFdX+l1gd6oONBX4
         7uJ8DwHvRMG/FsREt1WVmgO1rFeK/YduJdLfxnoeLu5D+kqJMJj4faqk7mk2j47lvInJ
         HPkUI+NRXSN+EVb6O4h9PP0HNTRJ9J3XfTj5d+oR9omzSHo8fdJWLeij/T902C6B/6dK
         fIM19Uv/+c9pGuX95O7OVkHVkUaYRJbjbTCXAL1pxMONtyfUQM4Iz/ghipi2k51b2opN
         HplpTkArvfF7Oln0hBI037RdZJtAPv+oAqH7gLwLNmj2MQAgZyNyKiSuAbcDAdU5oxVY
         gbaw==
X-Forwarded-Encrypted: i=1; AHgh+RpYp00x0+o9m9rbHx+iadf1g9CsE7GdKzMgWPkqt8sHTw/Prel8KqHdDnPEZQmudA9GxVjiJYYUAbIrSw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxt8kKRmv1AcUBrVwDTgnesDXhLt74lUbS1k0ZKCZk70NQSfuEm
	+6eDZjHUPJwa7xZ/Cfc4zppnN+J8yYMfaH894QdBM+w6wAHphO1oC/5JDoCEsjj7vdE=
X-Gm-Gg: AR+sD12Qm5PD5bMtfn9GHqOvUMG0Ic60MbJHlAoEC+jEM4Nr5RwSapo4mMYTkx1xgCV
	3NtMHrPoxdQN15zq4MAizzkCbQ6pxAJXBFr4xOvVovfU13bR+iYUEFLDuXOnMfw36DxOsu5fPlM
	RlBdMovZau//gqC5JmO4OSCZ7Z3BYOO2p5/jFdQ3QYiikE1i3wqFJXIGco1BH1BgH+tH3Anl8WZ
	F/YowTcylBN0mWg3pWubJK3bNrSiUhexsSm2IH4W0c9+5uJUC4oqbWrSpt0TGx1xs20dgcJuazq
	4LW+gVuhRkIPAixAPiwUzi+KNLzSRbP0nmTf36n2r4bZqQhIW/CFfvvF6MXmGURp+JFL0Di9h7W
	6oeTQKNNcTQyGi+i6yhVObo6K832seFzb3w9geG3TPJKW404wJJI05LivHShT81U1+9OU8bR+IY
	4vkCzX/t385bNxaSCvDPbpItaJN3UjFRCeX9MpXHN6pHkRmtTlY3tNv8VuYw8=
X-Received: by 2002:a17:903:2410:b0:2c6:8d95:fd7e with SMTP id d9443c01a7336-2d3187acb9emr19605805ad.6.1786440727293;
        Tue, 11 Aug 2026 02:32:07 -0700 (PDT)
Received: from plin-1878 ([136.226.240.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315f29afdsm4693525ad.19.2026.08.11.02.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 02:32:06 -0700 (PDT)
Date: Tue, 11 Aug 2026 17:31:56 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, samuel.holland@sifive.com,
	dlan@kernel.org, dfustini@oss.tenstorrent.com, michal.simek@amd.com,
	junhui.liu@pigmoral.tech, darshan.prajapati@einfochips.com,
	akpm@linux-foundation.org, zhangchunyan@iscas.ac.cn,
	luxu.kernel@bytedance.com, pincheng.plct@isrc.iscas.ac.cn,
	nick.hu@sifive.com, jim.shu@sifive.com, zong.li@sifive.com,
	greentime.hu@sifive.com, robin.randhawa@sifive.com,
	scott@riscstar.com, dave.patel@riscstar.com,
	raymond.mao@riscstar.com, anup@brainfault.org,
	pawandeep.oza@oss.qualcomm.com
Subject: Re: [PATCH v2 2/3] dt-bindings: riscv: Add Worlds per-hart properties
Message-ID: <anrsDDkkOKmnkzAa@plin-1878>
References: <20260729163908.249838-1-peter.lin@sifive.com>
 <20260729163908.249838-3-peter.lin@sifive.com>
 <20260730-glossy-pompous-quokka-c05c60@quoll>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260730-glossy-pompous-quokka-c05c60@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_023208_242692_E4F249D0 
X-CRM114-Status: GOOD (  15.98  )
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

Hi Krzysztof,

On Thu, Jul 30, 2026 at 09:30:24AM +0200, Krzysztof Kozlowski wrote:
> On Thu, Jul 30, 2026 at 12:39:07AM +0800, Yu-Chien Peter Lin wrote:
> > +  riscv,pmlwidlist:
> > +    $ref: /schemas/types.yaml#/definitions/uint64
> > +    description:
> > +      Optional bitmask of WIDs available for S-mode and U-mode use on this hart; each
> > +      set bit N indicates WID N is available. Firmware may read this to select platform
> > +      authorized WIDs for lower-privilege modes.
> >    # RISC-V has multiple properties for cache op block sizes as the sizes
> >    # differ between individual CBO extensions
> >    cache-op-block-size: false
> > diff --git a/Documentation/devicetree/bindings/riscv/worlds.yaml b/Documentation/devicetree/bindings/riscv/worlds.yaml
> > new file mode 100644
> > index 000000000000..cc8b3747591e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/riscv/worlds.yaml
> 
> Please run scripts/checkpatch.pl on the patches and fix reported
> warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
> patches and (probably) fix more warnings. Some warnings can be ignored,
> especially from --strict run, but the code here looks like it needs a
> fix. Feel free to get in touch if the warning is not clear.

The only issue I got is:

WARNING: DT binding documents should be licensed (GPL-2.0-only OR BSD-2-Clause)
#114: FILE: Documentation/devicetree/bindings/riscv/worlds.yaml:1:
+# SPDX-License-Identifier: (GPL-2.0 OR MIT)

Hope I am not missing other warnings or errors.

Thanks,
Peter Lin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
