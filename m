Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 151FBC3ABC3
	for <linux-riscv@archiver.kernel.org>; Sat, 10 May 2025 15:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JTUS9knPnjzXl0TqwacRVD5FNAERBFrk5ffq1N8Dquw=; b=hzreCSCmpkHrE7
	tRnNoX2FdHrt93fgi5DlT9Wco0TiRADCYUzMLeO0llpdjN/FpzbtE4wN/jR+NWwfyDBOQKE1iAR19
	esPmwlwijou4jQaRsoitjPEeO4tMdtfvZNqhPMLSx/MdLBjuIxgpxfei2hFx9iQyX1H7O7CLT/xrA
	W1AfjAyf3qiBuBCQG77Z8KHmEVrfzLylqPjT/8XpSc7kC1ho1mhP2dRm3oVCC24lAtD3gqgzWdkfx
	mTbuSl0fkHtfSWua/rYFhrEiWNfBLGxhAtVCwZw6e8ZNfs88m4QovB9/72cTNVxBAV63FH+xhJUcU
	PwRRoGRTSaoJXGyasY5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDlqA-000000063uG-0hnq;
	Sat, 10 May 2025 15:10:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDlq6-000000063sw-2U3V
	for linux-riscv@lists.infradead.org;
	Sat, 10 May 2025 15:10:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746889805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LSp0XQpzSTcNL5A8tzPVsKcCl0AKeTrOu/sN2l5jc/g=;
	b=hUGFeQvWzsMtw/PluX697JlnxJzgm59FgQsnZ0wO+vYVkgR2XIJ0ocOlO98vWlmtqaoOEx
	Z3jWN7CXRTI0zUG4MdE2g6OwcuYrYKDpjtvPXRGolWMRg79NePHhVUoYuQaoAZQLcHvgY7
	GeMW8xJoReQQBhQ1u4Wf9iKw0Qtmv+s=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-0JPHazARO5mxa9BtSV2-Zw-1; Sat, 10 May 2025 11:10:03 -0400
X-MC-Unique: 0JPHazARO5mxa9BtSV2-Zw-1
X-Mimecast-MFC-AGG-ID: 0JPHazARO5mxa9BtSV2-Zw_1746889802
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a1fdf65ddfso337187f8f.1
        for <linux-riscv@lists.infradead.org>; Sat, 10 May 2025 08:10:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746889802; x=1747494602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LSp0XQpzSTcNL5A8tzPVsKcCl0AKeTrOu/sN2l5jc/g=;
        b=fxhiL6+ATs/dLNbelRkQEhdKjZgM+PpMaJdiI8PVjY9Fgx51jlwUW/zhYRnTHcKwXA
         7PDFRliW5RcQPtqdXcvqo8if4QN1Fq74KompY5KGTCspn+iki2gcunqsYmj08fEI/SpN
         ouKkKoh4pbZXwfvZ+L1Mtigj2GfuiV1gOrsRzuDFSIruDMpoJ8+2x9Miqtk4XM11Ultt
         GkikbQmUiLWt7+9HS8T4dovv46FqkhL7hoeDVf9pGwBLOZ4GseeV0ERMDh8i3yuMp8nt
         Z299zZ7UVS4jrEM/ciUm0tVBxQ7BPYxbGK94aAVS1zsuSjZlnoAf9MNkA0iGt1kkTuJ6
         Jfxw==
X-Forwarded-Encrypted: i=1; AJvYcCXwjATJHbxSZ92CdcELE6h50z+1MtvpeEUCgx+yDXmO6Ro2r3lYyTLdnnVF0F5wguZ+PckvKgJrAFNJuA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwSN0kdThLeCtz7hEC/k7cELZ3W6tG9L0Dx5/iZzcGs1CnTb+JP
	HZb5vkeFG6FUO/2Rn1DW+9B/iJFzzjNRNZKiYVmJmjS+gTwSr4EMTtKKrlOkNPWKuf9Tr3mVTOf
	m7UI44txzTEL6/koIE6mbwB7+XowDioIN2PgQSRxNz0ZAwU46iSZ7tNWlZ7LyPMum58vbnuxUId
	VfW45/AaH4BLdsoI0fiflNeq1WaUuMcgG8fPfnglly
X-Gm-Gg: ASbGnctzzDZwwSwdKXzLndJODqi7WR0FtUs2+HfhOPCk9/xxTWmjnimid84/pgttATx
	depmT5Gl9H9VMGBq7KvPGwJ08uuseRU7bwkRYQJgWgUkZd4+bH2P0sqAUMHH/FzT8T3Jm
X-Received: by 2002:adf:f44c:0:b0:3a1:f701:ea15 with SMTP id ffacd0b85a97d-3a1f701ea9bmr5340951f8f.55.1746889802390;
        Sat, 10 May 2025 08:10:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTrsQVFY/Fgr8ISgzK47J1kK+Yrt701ZSvnSrnrcZmClYr8VRCd08zVc7FFV0ODaXSCdq0pbsc9V1BsmPfAkY=
X-Received: by 2002:adf:f44c:0:b0:3a1:f701:ea15 with SMTP id
 ffacd0b85a97d-3a1f701ea9bmr5340935f8f.55.1746889801993; Sat, 10 May 2025
 08:10:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy09tkokvdvACCQACLdvppTTQHDOR+O4jtkhVP4PaW_k7w@mail.gmail.com>
In-Reply-To: <CAAhSdy09tkokvdvACCQACLdvppTTQHDOR+O4jtkhVP4PaW_k7w@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sat, 10 May 2025 17:09:50 +0200
X-Gm-Features: AX0GCFtixaY2aut0ABjtOGBW3kol_5pEkPm5-SgtfoURVxZJrIE5ml20E7vbZQM
Message-ID: <CABgObfY+2CpcBNc8ugsrvOKr9dR_P=KBuysgVN_cx3_ekQSR2Q@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv fixes for 6.15 take #1
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DsWsBw-3cU1T8lgAVmnF3HYLhanpxFr21SBp4wJ065Q_1746889802
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_081011_552254_7672228B 
X-CRM114-Status: UNSURE (   6.97  )
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

T24gRnJpLCBNYXkgMiwgMjAyNSBhdCA4OjUz4oCvQU0gQW51cCBQYXRlbCA8YW51cEBicmFpbmZh
dWx0Lm9yZz4gd3JvdGU6Cj4KPiBIaSBQYW9sbywKPgo+IFdlIGhhdmUgb25lIGZpeCBmb3IgdGhl
IDYuMTUga2VybmVsIHdoaWNoIGFkZHMgbWlzc2luZwo+IHJlc2V0IG9mIHNtc3RhdGVlbiBDU1Jz
Lgo+Cj4gUGxlYXNlIHB1bGwuCgpEb25lLCB0aGFua3MuCgpQYW9sbwoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
