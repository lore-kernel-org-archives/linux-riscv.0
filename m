Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B66FCEEE270
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2024 00:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:From:MIME-Version:Date:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c8JDLkP3XZvBBkSTfstLGxkfN0pWJRYyD/lftwhngeY=; b=u883YJ3kN/ss0n
	8w3tyj1Q3uj65euaI/I+KSVFz6OGr3Oz6Zn4W/alDW1daHqdttJ28QKm7Im2S+F7ifnAJ0lg3eezN
	bbznLfk1CNKgUI46WdxteBSbzsyTiQSi5Yv4SW58bFWTbA3Kvc9UuCq5VVkYk6iMLhpxO5G/2ECxJ
	QqR7bR5+LuR8VIwqnzKaAPB9vrH57Fq92uyrIOoDG0MgxnnzXM+ijhi+KpNAu6xsSCd3oVLWyJgLg
	xj7sAKt9Jt6WidKE91TzgI/sPP5plBFk2JO75USMYK5K+n4AHwTfElsxsVf8NDMS9ZSv4QmWNOUMS
	9yOwZfCVhrjWTg3sAMMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sou1S-0000000EZco-1RhX;
	Fri, 13 Sep 2024 00:18:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sou1P-0000000EZbJ-0GMC
	for linux-riscv@lists.infradead.org;
	Fri, 13 Sep 2024 00:18:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BB5145C0399;
	Fri, 13 Sep 2024 00:18:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0FBAC4CEC3;
	Fri, 13 Sep 2024 00:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726186725;
	bh=NJ0bm5aOPJS2BFRO+4CKYlGi6Px1qkw7j07yz/Q7nNw=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=qYhQzK4vF5/1OZU5KHGENzVChr6ge9H+jyFeIonuLbCp8gxnh2HoR4tMH6r9ySzT7
	 M90Uhd8nTZ9aGVlBS62SqC5dZBQOL1yZOBRs3zh23Y9lAmLGNaVzSxYrqN2kgoe8cw
	 Ud6wStVcNaGm6CxgtXNKQYOdBVB/r1cq2ggWy3nUnOT6LpmvdQxG7SAtno0acaPTmN
	 1qA7Hen4EBBK4SbqkjvonzxNKxiWJF0KX42pSWE4g9jn0dk+ID+QgWiLC1LLgDlePB
	 uhUr6TXCueydWaJ5SDC2N1+/loraiKIro9HOPqznE9ROU0reAHki5gooOrEr4wE8LS
	 3tzx18yEbGhAA==
Date: Thu, 12 Sep 2024 19:18:43 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Deepak Gupta <debug@rivosinc.com>
In-Reply-To: <20240912231650.3740732-8-debug@rivosinc.com>
References: <20240912231650.3740732-1-debug@rivosinc.com>
 <20240912231650.3740732-8-debug@rivosinc.com>
Message-Id: <172618672393.1080888.11349502657556279668.robh@kernel.org>
Subject: Re: [PATCH v4 07/30] riscv: zicfilp / zicfiss in dt-bindings
 (extensions.yaml)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_171847_211293_912033F3 
X-CRM114-Status: GOOD (  10.18  )
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
Cc: quic_zhonhan@quicinc.com, x86@kernel.org, sorear@fastmail.com, zev@bewilderbeest.net, linux-doc@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, palmer@sifive.com, cuiyunhui@bytedance.com, bjorn@rivosinc.com, costa.shul@redhat.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, guoren@kernel.org, willy@infradead.org, zong.li@sifive.com, hpa@zytor.com, puranjay@kernel.org, linux-riscv@lists.infradead.org, shuah@kernel.org, kees@kernel.org, ancientmodern4@gmail.com, cleger@rivosinc.com, quic_bjorande@quicinc.com, arnd@arndb.de, lorenzo.stoakes@oracle.com, corbet@lwn.net, schwab@suse.de, deller@gmx.de, david@redhat.com, andrii@kernel.org, alx@kernel.org, akpm@linux-foundation.org, tanzhasanwork@gmail.com, libang.li@antgroup.com, samitolvanen@google.com, linux-arch@vger.kernel.org, jszhang@kernel.org, yang.lee@linux.alibaba.com, ajones@ventanamicro.com, greentime.hu@sifive.com, evan@rivosinc.com, revest@chromium.org, devicetree@vger.kernel.org, aou@eecs.berkeley.edu, jerry.shih@sifive.com, alexghiti@rivosinc.com, xiao.w.wang@intel.com, mingo@redhat.com, charlie@rivosinc.com, dawei.li@shingroup.cn, bgray@linux.ibm.com, dave.hansen@linux.intel.com, songshuaishuai@tinylab.org, broonie@kernel.org, bp@alien8.de, Liam.Howlett@oracle.com, paul.walmsley@sifive.com, mchitale@ventanamicro.com, namcaov@gmail.com, tglx@linutronix.de, usama.anjum@collabora.com, ben.dooks@codethink.co.uk, vbabka@suse.cz, osalvador@suse.de, linux-kselftest@vger.kernel.org, bhe@redhat.com, ke.zhao@shingroup.cn, atishp@rivosinc.com, oleg@redhat.com, conor@kernel.org, samuel.holland@sifive.com, antonb@tenstorrent.com, leobras@redhat.com, palmer@dabbelt.com, ebiederm@xmission.com, andy.chiu@sifive.com, anup@brainfault.org, linux-fsdevel@vger.kernel.org, brauner@kernel.org, krzk+dt@kernel.org, sameo@rivosinc.com, rppt@kernel.org, ryan.roberts@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On Thu, 12 Sep 2024 16:16:26 -0700, Deepak Gupta wrote:
> Make an entry for cfi extensions in extensions.yaml.
> 
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  .../devicetree/bindings/riscv/extensions.yaml        | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/riscv/extensions.yaml:367:75: [error] missing starting space in comment (comments)
./Documentation/devicetree/bindings/riscv/extensions.yaml:368:13: [error] syntax error: expected <block end>, but found '<scalar>' (syntax)
./Documentation/devicetree/bindings/riscv/extensions.yaml:373:75: [error] missing starting space in comment (comments)
./Documentation/devicetree/bindings/riscv/extensions.yaml:374:13: [warning] wrong indentation: expected 10 but found 12 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/riscv/extensions.yaml: ignoring, error parsing file
make[2]: *** Deleting file 'Documentation/devicetree/bindings/riscv/extensions.example.dts'
Documentation/devicetree/bindings/riscv/extensions.yaml:368:13: did not find expected key
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/riscv/extensions.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/riscv/cpus.example.dtb: cpu@0: False schema does not allow {'clock-frequency': 0, 'compatible': ['sifive,rocket0', 'riscv'], 'device_type': ['cpu'], 'i-cache-block-size': 64, 'i-cache-sets': 128, 'i-cache-size': 16384, 'reg': [[0]], 'riscv,isa-base': ['rv64i'], 'riscv,isa-extensions': [1761635584, 1627415296], 'interrupt-controller': {'#interrupt-cells': 1, 'compatible': ['riscv,cpu-intc'], 'interrupt-controller': True}, '$nodename': ['cpu@0']}
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/riscv/cpus.example.dtb: cpu@0: Unevaluated properties are not allowed ('riscv,isa-base', 'riscv,isa-extensions' were unexpected)
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/riscv/cpus.example.dtb: cpu@1: False schema does not allow {'clock-frequency': 0, 'compatible': ['sifive,rocket0', 'riscv'], 'd-cache-block-size': 64, 'd-cache-sets': 64, 'd-cache-size': 32768, 'd-tlb-sets': 1, 'd-tlb-size': 32, 'device_type': ['cpu'], 'i-cache-block-size': 64, 'i-cache-sets': 64, 'i-cache-size': 32768, 'i-tlb-sets': 1, 'i-tlb-size': 32, 'mmu-type': ['riscv,sv39'], 'reg': [[1]], 'tlb-split': True, 'riscv,isa-base': ['rv64i'], 'riscv,isa-extensions': [1761635584, 1627416064, 1677746944], 'interrupt-controller': {'#interrupt-cells': 1, 'compatible': ['riscv,cpu-intc'], 'interrupt-controller': True}, '$nodename': ['cpu@1']}
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/riscv/cpus.example.dtb: cpu@1: Unevaluated properties are not allowed ('riscv,isa-base', 'riscv,isa-extensions' were unexpected)
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/riscv/cpus.example.dtb: cpu@0: False schema does not allow {'device_type': ['cpu'], 'reg': [[0]], 'compatible': ['riscv'], 'mmu-type': ['riscv,sv48'], 'riscv,isa-base': ['rv64i'], 'riscv,isa-extensions': [1761635584, 1627416064, 1677746944], 'interrupt-controller': {'#interrupt-cells': 1, 'interrupt-controller': True, 'compatible': ['riscv,cpu-intc']}, '$nodename': ['cpu@0']}
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/riscv/cpus.example.dtb: cpu@0: Unevaluated properties are not allowed ('riscv,isa-base', 'riscv,isa-extensions' were unexpected)
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
./Documentation/devicetree/bindings/riscv/extensions.yaml:368:13: did not find expected key
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1432: dt_binding_check] Error 2
make: *** [Makefile:224: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240912231650.3740732-8-debug@rivosinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
