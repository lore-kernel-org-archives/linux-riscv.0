Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1EA4C072A2
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Nov 2023 14:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nw3EW0H0ofAmYKYxiWz7jVDNLEvj4qv9axeJtKexrYw=; b=1o5rvynX5wBFCx
	EPqAuEQoBxA0z0Ncg8P+aC88YVQxGHANIeHVHgqbKfKF8xGBeh5AIR8GfkZwmRQ03cHIxdOgCtvd+
	BJJuCyiGcfflguV9OlZMBKMFtpdXPmnK9vaQl7/TifAqtYaGx87/AX3IntpzznTGXqT/YmT5hZyKa
	RlXHvQnqY1EQDB4L89xtD2zQOZ7sdIQPyysPR8tSxm87QVkcxwCnqKXADXl/X4J3EPQDKHvweQe9C
	AABGGGpkeSOBA/Gjed/NbllLlNbNhxYF1L7d8z2Sjo649AM7VwyYjpr1Lo0IrfVzcd2idkKiG2KLA
	nRCDEXFhODNc2KH08sjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3zPZ-006gxK-0j;
	Fri, 17 Nov 2023 14:01:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3zPW-006gwG-0j
	for linux-riscv@lists.infradead.org;
	Fri, 17 Nov 2023 14:01:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700229688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pq04hPwM76I6HfjjQsgEZc2UgA6OA1Oi638JwoZfCNQ=;
	b=XWbEkDScMgH5ZwjFuhSGvD5BLa4pKIQZTrQ6tsJefAPoqQmChQRDJC0r0VULdiJ5fkzPVU
	o9jULUe4R9JafJE2JZqgjv5gyDSvF8/u04tUnaCBF3IdvgJWIy9wzJPi6EoclU9lIUPYZi
	XFr+KVlZxp+J5TvO3YZNQL7bxAq/pw0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-9-LNEJoTcXPIOoWatljCvfVA-1; Fri, 17 Nov 2023 09:01:24 -0500
X-MC-Unique: LNEJoTcXPIOoWatljCvfVA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0B062811E8D;
	Fri, 17 Nov 2023 14:01:23 +0000 (UTC)
Received: from localhost (unknown [10.72.112.24])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 46EC140C6EB9;
	Fri, 17 Nov 2023 14:01:21 +0000 (UTC)
Date: Fri, 17 Nov 2023 22:01:17 +0800
From: "bhe@redhat.com" <bhe@redhat.com>
To: "Liu, Yujie" <yujie.liu@intel.com>
Cc: lkp <lkp@intel.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"kexec@lists.infradead.org" <kexec@lists.infradead.org>,
	"x86@kernel.org" <x86@kernel.org>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 2/7] kexec_file: print out debugging message if required
Message-ID: <ZVdyLdAzgNBXfjiW@MiWiFi-R3L-srv>
References: <20231114153253.241262-3-bhe@redhat.com>
 <202311160431.BXPc7NO9-lkp@intel.com>
 <ZVcvBft/T3cbRBWr@MiWiFi-R3L-srv>
 <39ccb4fda795a76996cf6d1c3b25909692358211.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <39ccb4fda795a76996cf6d1c3b25909692358211.camel@intel.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_060130_375560_D11971C7 
X-CRM114-Status: GOOD (  19.63  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 11/17/23 at 09:37am, Liu, Yujie wrote:
> Hi Baoquan,
> =

> On Fri, 2023-11-17 at 17:14 +0800, Baoquan He wrote:
> > Hi,
> > =

> > On 11/16/23 at 05:04am, kernel test robot wrote:
> > > Hi Baoquan,
> > > =

> > > kernel test robot noticed the following build errors:
> > > =

> > > [auto build test ERROR on arm64/for-next/core]
> > > [also build test ERROR on tip/x86/core powerpc/next powerpc/fixes lin=
us/master v6.7-rc1 next-20231115]
> > > [If your patch is applied to the wrong git tree, kindly drop us a not=
e.
> > > And when submitting patch, we suggest to use '--base' as documented in
> > > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > > =

> > > url:=A0=A0=A0 https://github.com/intel-lab-lkp/linux/commits/Baoquan-=
He/kexec_file-add-kexec_file-flag-to-control-debug-printing/20231114-234003
> > > base:=A0=A0 https://git.kernel.org/pub/scm/linux/kernel/git/arm64/lin=
ux.git=A0for-next/core
> > > patch link:=A0=A0=A0 https://lore.kernel.org/r/20231114153253.241262-=
3-bhe%40redhat.com
> > > patch subject: [PATCH 2/7] kexec_file: print out debugging message if=
 required
> > > config: hexagon-comet_defconfig (https://download.01.org/0day-ci/arch=
ive/20231116/202311160431.BXPc7NO9-lkp@intel.com/config)
> > > compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.=
git=A0ae42196bc493ffe877a7e3dff8be32035dea4d07)
> > > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/a=
rchive/20231116/202311160431.BXPc7NO9-lkp@intel.com/reproduce)
> > > =

> > =

> > Thanks for reporting.
> > =

> > I met below failure when following the steps of provided reproducer.
> > Could anyone help check what's wrong with that?
> =

> Sorry this seems to be a bug in the reproducer. Could you please change
> the compiler parameter to "COMPILER=3Dclang-16" and rerun the command? We
> will fix the issue ASAP.

Here you are. Thanks for your quick response.
------------------------------
[root@~ linux]# COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang-16 ~/bi=
n/make.cross W=3D1 O=3Dbuild_dir ARCH=3Dhexagon olddefconfig
Compiler will be installed in /root/0day
lftpget -c https://cdn.kernel.org/pub/tools/llvm/files/./llvm-16.0.6-x86_64=
.tar.xz
/root/linux                                                                =
             =

tar Jxf /root/0day/./llvm-16.0.6-x86_64.tar.xz -C /root/0day
PATH=3D/root/0day/llvm-16.0.6-x86_64/bin:/root/.local/bin:/root/bin:/usr/li=
b64/ccache:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin
make --keep-going LLVM=3D1 CROSS_COMPILE=3Dhexagon-linux- LLVM_IAS=3D1 --jo=
bs=3D128 KCFLAGS=3D-Warray-bounds -Wundef -fstrict-flex-arrays=3D3 -funsign=
ed-char -Wenum-conversion W=3D1 O=3Dbuild_dir ARCH=3Dhexagon olddefconfig
make[1]: Entering directory '/root/linux/build_dir'
  GEN     Makefile
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/conf.o
  HOSTCC  scripts/kconfig/confdata.o
  HOSTCC  scripts/kconfig/expr.o
  HOSTCC  scripts/kconfig/lexer.lex.o
  HOSTCC  scripts/kconfig/menu.o
  HOSTCC  scripts/kconfig/parser.tab.o
  HOSTCC  scripts/kconfig/preprocess.o
  HOSTCC  scripts/kconfig/symbol.o
  HOSTCC  scripts/kconfig/util.o
  HOSTLD  scripts/kconfig/conf
#
# configuration written to .config
#
make[1]: Leaving directory '/root/linux/build_dir'

> =

> > [root@~ linux]# COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang ~/b=
in/make.cross W=3D1 O=3Dbuild_dir ARCH=3Dhexagon olddefconfig
> > Compiler will be installed in /root/0day
> > lftpget -c https://cdn.kernel.org/pub/tools/llvm/files/
> > get1: /pub/tools/llvm/files/: files/: Is a directory
> > Failed to download https://cdn.kernel.org/pub/tools/llvm/files/
> > clang crosstool install failed
> > Install clang compiler failed
> > setup_crosstool failed
> =

> =



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
