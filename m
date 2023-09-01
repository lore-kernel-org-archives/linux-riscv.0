Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5194ECA0FE1
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 11:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=boJYQ+v5iqO4Uq5/hmORGjc1eGWKrFdsxJ0PuFz0gzA=; b=OhUn4/Vatoo/FZ
	p22jG4fcryq3FES56OyXAAy+zzIDc8OAiHM5NLBOFIi4e7ZxiGjW/uIWLCGLR4fBZu9SgmXcDygCt
	z3dMKisM6d5Fp5I/lkmT1jWS/yXj7eZc8fbtr9ciwvMG1WDLi2BAx5mU7+4kJF0UUk5CKyXbdGRMB
	CeT7xX6ZsL9BdGK6TXDoXWWpYvgU8u+dv8TC3Fb/IDENMimej4GEirVDqCsojYq6K8E/VrJKmdsEo
	m1YN+zmxLSVf9H7hQWl5Je5zMTVlVVsE+uwYefn+VSpCsRP0dI2ZTpcEMFUFRVDyTM/wZFwsf3i/u
	r48jLQMPkv6QyRmMhNTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qc2it-00HHH0-2p;
	Fri, 01 Sep 2023 11:53:59 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qc2iq-00HHG4-2L
	for linux-riscv@lists.infradead.org;
	Fri, 01 Sep 2023 11:53:58 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-77a62a84855so71755039f.1
        for <linux-riscv@lists.infradead.org>; Fri, 01 Sep 2023 04:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693569232; x=1694174032; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TV6C0hh2ZIMC4A3RZXds3JrT4JY8ZfGJ9YXC8hLoRZE=;
        b=kkA9RHGJOrU7cvla2hnkk+9kZk2O5z8llHZowTxRRuAVKZuIJ1mfIJOpsCouL5oTfD
         pYeAb0dwxVUSPI3asZ9ksDHmGaDQIA/Aj+GgQHnLg+89jB/5iRAsZcBj15ysmTEqRGDc
         Qm3lqCviHJh2yWQ62ZuczK3tlM//s7bwRpZ4NOyrp6O/uswhOLUiE1emIJt67fq08qFZ
         4ON7QC5vI8CqFRtCGPAmTA3GTEF0c/WbK6R8tLk1YBJdV0sEQcnLjCD1qtnA7h9QAvaq
         c6KLW1I5Okr4g1u+MYqxjwBZfXOtvvHLPIJ8PpFxaBKvakjCtiQdAULdjLR6TJyz4jaT
         VfpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693569232; x=1694174032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TV6C0hh2ZIMC4A3RZXds3JrT4JY8ZfGJ9YXC8hLoRZE=;
        b=g0aj9P0Qy8+eq5gV0s28NBUYvvISTXlNPMvf9klyMzUfLRM60yTxgowCEtW4KMcXv3
         a7nvi68QKHkBPjulKAzn31klK2dgDNKQNznGsWtiLjeSAg0FhTCCky2asDm+tF1AeMry
         xxmekDYbkRWMPEbJG/V7Vox25brK9SGPlwm1bMbeD72hKeimhT4pBMa/mvk5DKbHnGpz
         Bgowyl3UaYJXzSIps6bNheBo52Gnw19a+h6SikKvk1nuWrBgwGgtryEM8HPaUn09j30j
         Wp6WsTskz6FMAstxq44GPlPNUcVGRx6ocZY07wQvWMsNYspR8qls16OcJghJoGAqbyvQ
         /xYQ==
X-Gm-Message-State: AOJu0YyhWzLDXfoJU57JjUtNMV+2Bo5hPSGmF65ehVkMgcYA+c29u6IX
	wkJ+7lZFRmnuAidGsMg84cn1fImloZ4PtDLGHls=
X-Google-Smtp-Source: AGHT+IFOz7bKJ/aLhXtWbNR53Jf4XM4L67jj0p3umv+nMADttKamdLEE34OkiRM17N6w6Ncvt4xUTKT3tDXmeX3ay+4=
X-Received: by 2002:a05:6602:160b:b0:792:792e:6619 with SMTP id
 x11-20020a056602160b00b00792792e6619mr3050794iow.2.1693569232710; Fri, 01 Sep
 2023 04:53:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230901110936.313171-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUyiWOdXtGR8o4kKOyYV8JwoPN-FvMBxYmcRoKLAdu3PQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUyiWOdXtGR8o4kKOyYV8JwoPN-FvMBxYmcRoKLAdu3PQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 1 Sep 2023 12:53:00 +0100
Message-ID: <CA+V-a8s76eZnmBBZ0uuQLUo6Dj_yCeW+0XHMzsj2Udezti2RfQ@mail.gmail.com>
Subject: Re: [PATCH] soc: renesas: Kconfig: For ARCH_R9A07G043 select the
 required configs if dependencies are met
To: Geert Uytterhoeven <geert@linux-m68k.org>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, 
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, kernel test robot <lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_045356_762453_9D7D96A4 
X-CRM114-Status: GOOD (  18.00  )
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

SGkgR2VlcnQsCgpUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcuCgpPbiBGcmksIFNlcCAxLCAyMDIz
IGF0IDEyOjQ04oCvUE0gR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4g
d3JvdGU6Cj4KPiBIaSBQcmFiaGFrYXIsCj4KPiBPbiBGcmksIFNlcCAxLCAyMDIzIGF0IDE6MTDi
gK9QTSBQcmFiaGFrYXIgPHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPiB3cm90ZToKPiA+IEZy
b206IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNv
bT4KPiA+Cj4gPiBUbyBwcmV2ZW50IHJhbmRjb25maWcgYnVpbGQgaXNzdWVzIHdoZW4gZW5hYmxp
bmcgdGhlIFJaL0ZpdmUgU29DLCBjb25zaWRlcgo+ID4gc2VsZWN0aW5nIHNwZWNpZmljIGNvbmZp
Z3VyYXRpb25zIG9ubHkgd2hlbiB0aGVpciBkZXBlbmRlbmNpZXMgYXJlCj4gPiBzYXRpc2ZpZWQu
Cj4KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghCj4KPiA+IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVz
dCByb2JvdCA8bGtwQGludGVsLmNvbT4KPiA+IENsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvb2Uta2J1aWxkLWFsbC8yMDIzMDgzMTE2MTAuZWM2Ym0yRzgtbGtwQGludGVsLmNvbS8KPiA+
IFNpZ25lZC1vZmYtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBi
cC5yZW5lc2FzLmNvbT4KPgo+IEZpeGVzOiBlZDFhODg3MmZmODM5ZGUwICgic29jOiByZW5lc2Fz
OiBLY29uZmlnOiBTZWxlY3QgdGhlIHJlcXVpcmVkCj4gY29uZmlncyBmb3IgUlovRml2ZSBTb0Mi
KQo+Cj4gPiAtLS0gYS9kcml2ZXJzL3NvYy9yZW5lc2FzL0tjb25maWcKPiA+ICsrKyBiL2RyaXZl
cnMvc29jL3JlbmVzYXMvS2NvbmZpZwo+ID4gQEAgLTMzNCwxMCArMzM0LDExIEBAIGlmIFJJU0NW
Cj4gPiAgY29uZmlnIEFSQ0hfUjlBMDdHMDQzCj4gPiAgICAgICAgIGJvb2wgIlJJU0MtViBQbGF0
Zm9ybSBzdXBwb3J0IGZvciBSWi9GaXZlIgo+ID4gICAgICAgICBzZWxlY3QgQVJDSF9SWkcyTAo+
ID4gLSAgICAgICBzZWxlY3QgQVg0NU1QX0wyX0NBQ0hFCj4gPiArICAgICAgIHNlbGVjdCBBWDQ1
TVBfTDJfQ0FDSEUgaWYgUklTQ1ZfRE1BX05PTkNPSEVSRU5UCj4gPiAgICAgICAgIHNlbGVjdCBE
TUFfR0xPQkFMX1BPT0wKPiA+IC0gICAgICAgc2VsZWN0IEVSUkFUQV9BTkRFUwo+ID4gLSAgICAg
ICBzZWxlY3QgRVJSQVRBX0FOREVTX0NNTwo+ID4gKyAgICAgICBzZWxlY3QgRVJSQVRBX0FOREVT
IGlmIFJJU0NWX1NCSQo+ID4gKyAgICAgICBzZWxlY3QgRVJSQVRBX0FOREVTX0NNTyBpZiBFUlJB
VEFfQU5ERVMKPiA+ICsKPiA+ICAgICAgICAgaGVscAo+ID4gICAgICAgICAgIFRoaXMgZW5hYmxl
cyBzdXBwb3J0IGZvciB0aGUgUmVuZXNhcyBSWi9GaXZlIFNvQy4KPgo+IFJldmlld2VkLWJ5OiBH
ZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgo+Cj4gQXMgdGhlIG9m
ZmVuZGluZyBjb21taXQgd29uJ3QgYmUgaW4gbXkgdHJlZSB1bnRpbCB2Ni42LXJjMSwgSSBjYW5u
b3QKPiB0YWtlIGl0IG5vdywgYW5kIHJpc2MvZm9yLW5leHQgc291bmRzIGxpa2UgdGhlIGJlc3Qg
dGFyZ2V0Lgo+IEFja2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xp
ZGVyLmJlPgo+CkFncmVlZC4KClBhbG1lciwgY2FuIHlvdSBwbGVhc2UgcGljayB0aGlzIHBhdGNo
IHZpYSByaXNjdiB0cmVlPwoKQ2hlZXJzLApQcmFiaGFrYXIKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
