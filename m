Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0114C27C40
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Aug 2023 18:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OeC7DKi0b94RaICAWtrIYkWoNkCHc2C4wETOq7G2Lo4=; b=kNHrBvBZfUZ/bF
	DTCU0beE/nMM8Xw+XTH1QgIWfP3Aes3rcPOi54p9KD74NqcfZep6YYyjMdgxWlSxEpzE/F1C8Kiso
	Z1Z/pf/PxStpP9Reu5vYZsk6A0mI2TUUE3beTDgE8POD1bO0aKBk5o56mp/mMmn+WyBHdh72LQcGI
	r51+pw89rkDYOgQVPTOw4pE31brDOjmjRuJqm8jdALt62ikgj01OZ5UsLwbqu/rQoQQK63a+qoZ5Q
	NgoP+joph0V+Yg8xQqR53HR/IZrPWyyxbqOWljRTh1LDDpCuX7FurWi7pzUHkwQEXACln2g3WDjga
	P+8O2vnlp1Lv3XN87ASA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYsb2-001KN7-2Y;
	Wed, 23 Aug 2023 18:28:48 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYsb0-001KM5-0d
	for linux-riscv@lists.infradead.org;
	Wed, 23 Aug 2023 18:28:47 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2bb99fbaebdso92093531fa.0
        for <linux-riscv@lists.infradead.org>; Wed, 23 Aug 2023 11:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692815322; x=1693420122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tnJCtNUR93TcyXIKIwrBGhxaKICGrUKMujSweQQ4+cw=;
        b=JEoBukpGk8amJeqXXiXewlkD4OGiFSWHQ4bha4VTX2dOaFrHzPF9FTv4UPKFznAuf/
         Hntavtc33kXxu16cnQmHRVy12ONkF/wqeKPdkEfgh8eXzVK+cBq0hlBoZ6mnvFvwrG7T
         xkWbwg/ZjpHKngq1ikL6jJWfknvFRkQirSLRDUCKaJuFMhyPspm5KHDqjz5/WE9bZTV0
         JG5B4xBQ1XPjbarQgW83swSe0zeNgYhEdKi35DSNODkz76a6dRwtAklf28TGF8FF1eJ+
         C2JCXfns6tc7g6Y0m8oWugCySPK8kS9OyRyqhtSocmg6AnVIdQlW8/Pl7FEGt7IX5Gj6
         MERQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692815322; x=1693420122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tnJCtNUR93TcyXIKIwrBGhxaKICGrUKMujSweQQ4+cw=;
        b=XtclgFCikz4SUz0jpytX1yt8WuS64xw/n6XlNqrlThVhx9iYB+VZbYMaSUddFiY0U9
         FR9st2kGCStgwO+x4BrWRo/plpUM048eFSOJNUb/eHmxJPdLFmYMbCxcMUGB7qK3Vldx
         3OXTMdC8VGYDGJRPe61fPrxp3CIPtVVi5n42MJTtvLoBWee3fG1HnnbFsS9Xh38amz0G
         FjcuSXCK2GHfQLRQPL4v+f22JywFB3Gsey+PG0NKTkj04OpDXCDIpKDpmCxxpsGwVa+J
         BJyNMrD27RyLu4HEtjvCD88voi12h2AOuWQPnPVCzgjWUq1MGM2FWD3vJMzyXttDgr47
         nd4A==
X-Gm-Message-State: AOJu0Yz5GloyvqPhzV92WU79qN9AeJyyKVqWkmDVs8noLoGl/J+QefZj
	HiQ0C9d1vhNzCvErPd3VT1vu6kYSZj2Da9PxcF4=
X-Google-Smtp-Source: AGHT+IF3kB6l7zcwpTYQASbxiqszHAQx1UTOgfwuyKWrwopfUZlC/RAnfkjkfe5oCDX7bkD55tuujrmsTx+zSfQcC4k=
X-Received: by 2002:a2e:8791:0:b0:2b7:2ea:33c3 with SMTP id
 n17-20020a2e8791000000b002b702ea33c3mr11602391lji.22.1692815321818; Wed, 23
 Aug 2023 11:28:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230823231059.3363698-1-pulehui@huaweicloud.com>
 <20230823231059.3363698-8-pulehui@huaweicloud.com> <87zg2hk44i.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87zg2hk44i.fsf@all.your.base.are.belong.to.us>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 23 Aug 2023 11:28:30 -0700
Message-ID: <CAADnVQLu5twbe_UpiJrD0wKq1YyHzZbfzYhsW-mte7vDmyna5g@mail.gmail.com>
Subject: Re: [PATCH bpf-next 7/7] selftests/bpf: Enable cpu v4 tests for RV64
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Pu Lehui <pulehui@huaweicloud.com>, linux-riscv <linux-riscv@lists.infradead.org>, 
	bpf <bpf@vger.kernel.org>, Network Development <netdev@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, Yonghong Song <yhs@fb.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Xu Kuohai <xukuohai@huawei.com>, 
	Puranjay Mohan <puranjay12@gmail.com>, Pu Lehui <pulehui@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_112846_235225_3D67F2B3 
X-CRM114-Status: UNSURE (   8.24  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBBdWcgMjMsIDIwMjMgYXQgMTE6MjXigK9BTSBCasO2cm4gVMO2cGVsIDxiam9ybkBr
ZXJuZWwub3JnPiB3cm90ZToKPgo+IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaWNsb3VkLmNvbT4g
d3JpdGVzOgo+Cj4gPiBGcm9tOiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWkuY29tPgo+ID4KPiA+
IEVuYWJsZSBjcHUgdjQgdGVzdHMgZm9yIFJWNjQsIGFuZCB0aGUgcmVsZXZhbnQgdGVzdHMgaGF2
ZSBwYXNzZWQuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2Vp
LmNvbT4KPgo+IEFja2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPgoKQmpv
cm4sCgpUaGFua3MgYSBsb3QgZm9yIHRoZSBxdWljayByZXZpZXchCkNvdWxkIHlvdSBnaXZlIGl0
IGEgc3BpbiBhcyB3ZWxsIGFuZCBob3BlZnVsbHkgYWRkIFRlc3RlZC1ieSA/CgpXZSBzdGlsbCBo
YXZlIHRpbWUgdG8gZ2V0IGl0IGludG8gYnBmLW5leHQgZm9yIHRoZSB1cGNvbWluZyBtZXJnZSB3
aW5kb3cuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
