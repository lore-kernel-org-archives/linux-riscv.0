Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CDEBCD4F4A
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Sep 2024 23:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5DVA/hpQqeVK7l0/OPMVB3ubbpYkdg+IgpCc8P6d6LA=; b=GV3+4BMIRKUuK0
	AqjB5AN3yPVRtCcsaoRbSzfeOTdGyoyc4vtD8MuLCFEUTM7+QbQsTlTj98RCGLBDub3tSSLNWNQ8o
	3AU1+F9SK6cRRTAIoYQA3vkbjtXgVSNTUBn0QpWpV/Tl793FzxMjBGbFtA23crmeTwT/VA0SD7MUo
	+U15Q9eIkbBbMxcfVfaBcVufeIbJXTb8eIP05QOQTif4YhofXTrF52Eg+1++uUHIYxG3/P+OjbS/M
	VB8/duulwwlsLu+opCTX8TObr24Qw4Oc0z00veOlAeFxL7bT2aiDYXIcDpZRfFWmtKhRcH+yBqaXg
	M7NvG7ZYzl6+2P0t19XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slz6o-00000006KNS-3Brk;
	Wed, 04 Sep 2024 23:08:18 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slz6l-00000006KMv-2hnC
	for linux-riscv@lists.infradead.org;
	Wed, 04 Sep 2024 23:08:17 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-20570b42f24so2365685ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 04 Sep 2024 16:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725491295; x=1726096095; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JuYY7Ue61iqYlGMoVC45JUKp7fJ5h0XkO3P1iEMCu2c=;
        b=YSRwXA6Ow+l4n2WpsQLlqHggyCTu7WY1+qpiUpnLGvi69MxXu28zquvOJLDm2vEDw7
         pPaVCLkAc4MgCZ66TBQOAZb0KQah9ZOP3aGgvYYaabayBo7DkIWdASWy1KgPyJnGMLFo
         cUEXZoaOd3KX6TC+sjf/QZV0tMgcesa/YVbj/fQ/cNLUsDu199uf6asnsdUDVWiE7PrT
         xvXdS3PpV8U7zn1AHw/AvMbyfjgQXTwJ3P+egOw6ZzlRSEsARv1e9nc51E1mqlV6nXA9
         +rr9aG8w+pk9V/nd9JHrX9hHh9LNWesBL6l6J9LQdapGstOMqo5mppdFxOo1eCsC5Mw7
         UpkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725491295; x=1726096095;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JuYY7Ue61iqYlGMoVC45JUKp7fJ5h0XkO3P1iEMCu2c=;
        b=JfVLMb3jfmqhSe2OZCTqkcGc6gpRRK+bBdbNpnmO8qojfzCrJExI1KOA5tSA2TCrsd
         ZyvbSrBX5LbBnavuOvfeo03vfQ8qGviHBhTqJIMOSayWamzlZXpHUI8YxV8M6CYvsNdd
         4AbkHX+cRjt+fs+QRvcXhxTAcUPDs86L7LOYW0zGdZFUAfwSZ0niqKn6QKYMaUZAwGIr
         aPMwNkdCsmIR7H61mkjyp/TGgsaLQ23Zp1dT1DRKjOIbWY607EhquKMzShlu0JnYlh2I
         ZsM+TVftUpnUVjrxG04PgASKXLABzfJJ4rhJAtvRsV/zuTYmfdfK2tWUtJALRH7ct/DV
         b4yw==
X-Forwarded-Encrypted: i=1; AJvYcCVPyuTXS1Thi/blSb9QJy0ydmcgpf+NLOmry/sV+3VFeeYo3BB2/gI/PuU68rIzd3qjTrfIKAvy1d+YvA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/HJMA5VFw5mn/gQgTpWv5oDE0p82E1EP/any7CIPx/ajiGY2U
	NAtCFRbuBuypFQL6V/Lq78uMsM5T26Wrqeb4NX03E0B1swGJebOC
X-Google-Smtp-Source: AGHT+IF4rQGkEVUHVpqqXf2jKmQLiLHqowPu6xYKSxVTfrDXBPMBmlKsnz4QlN3364FnuloKsGiLHQ==
X-Received: by 2002:a17:902:e543:b0:1fc:6a13:a394 with SMTP id d9443c01a7336-20699ae817dmr101712865ad.23.1725491294513;
        Wed, 04 Sep 2024 16:08:14 -0700 (PDT)
Received: from [192.168.0.235] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206ae951f35sm18340095ad.85.2024.09.04.16.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 16:08:13 -0700 (PDT)
Message-ID: <1bd4056c2b311aca03b7707b077f7555db4e55d6.camel@gmail.com>
Subject: Re: [PATCH bpf-next v2 03/10] selftests/bpf: Disable feature-llvm
 for vmtest
From: Eduard Zingerman <eddyz87@gmail.com>
To: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org, 
	linux-riscv@lists.infradead.org, netdev@vger.kernel.org
Cc: Andrii Nakryiko <andrii@kernel.org>, Mykola Lysenko <mykolal@fb.com>, 
 =?ISO-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>, Puranjay Mohan
 <puranjay@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Pu Lehui
 <pulehui@huawei.com>
Date: Wed, 04 Sep 2024 16:08:08 -0700
In-Reply-To: <fc9a03f1809cfdd80a9a8cb7b513e32302be5a43.camel@gmail.com>
References: <20240904141951.1139090-1-pulehui@huaweicloud.com>
	 <20240904141951.1139090-4-pulehui@huaweicloud.com>
	 <fc9a03f1809cfdd80a9a8cb7b513e32302be5a43.camel@gmail.com>
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_160815_705917_3C5A355B 
X-CRM114-Status: GOOD (  18.25  )
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

On Wed, 2024-09-04 at 12:37 -0700, Eduard Zingerman wrote:
> On Wed, 2024-09-04 at 14:19 +0000, Pu Lehui wrote:
> > From: Pu Lehui <pulehui@huawei.com>
> > 
> > After commit b991fc520700 ("selftests/bpf: utility function to get
> > program disassembly after jit"), Makefile will link libLLVM* related
> > libraries to the user binary execution file when detecting that
> > feature-llvm is enabled, which will cause the local vmtest to appear as
> > follows mistake:
> > 
> >   ./test_progs: error while loading shared libraries: libLLVM-17.so.1:
> >     cannot open shared object file: No such file or directory
> > 
> > Considering that the get_jited_program_text() function is a useful tool
> > for user debugging and will not be relied upon by the entire bpf
> > selftests, let's turn it off in local vmtest.
> > 
> > Signed-off-by: Pu Lehui <pulehui@huawei.com>
> > ---
> 
> I actually don't agree.
> The __jited tag is supposed to be used by selftests
> (granted, used by a single selftest for now).
> Maybe add an option to forgo LLVM linkage when test_progs are compiled?
> Regarding base image lacking libLLVM -- I need to fix this.
> 

Please consider using my commit [1] instead of this patch, it forces
static linking form LLVM libraries, thus avoiding issues with rootfs.
(This was suggested by Andrii off list).

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ez/bpf-next.git/commit/?h=selftest-llvm-static-linking&id=263bacf2f20fbc17204fd912609e26bdf6ac5a13


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
