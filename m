Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 418B0D6ACF4
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Nov 2024 16:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ry7fHMX2H2JqpvnpNNW6GFp0GUD+7GqV/ZdaOoNUocE=; b=wpED8GbxZJK8VW
	IbL2uhmm5c6PFgboWnh6GzamOl8KZ0nqwuGiLwOaFY8UL+SaMrpDci404zFs5+hy1KGdxTB3TwNko
	6WI2LFsrXjatWjiQ/V+zvK9hGeGlOLYyjbQZW35JZpVKn40DUYXjVKqRzmVZ2IIZ2A12LGe64LVuf
	CLk2K5b15/3fiadsFTE93f1nfV29U3w1EJLD8FUOlfYNjH6kht41B/z10sHIskjcjeoouMLmYr1N2
	MG0leeUOqyTBbZMohhQCZl1S9D4SwDhGnesnQAWpT+AsvGvo2Cs3U/TvHqSJKGF2iaRVmiqGjpQL2
	xOg7yogqVCp1MnHnz2Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGLMs-0000000Dhkf-3jSa;
	Wed, 27 Nov 2024 16:58:22 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGLGB-0000000DgVY-2Max
	for linux-riscv@lists.infradead.org;
	Wed, 27 Nov 2024 16:51:28 +0000
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-843671e1426so94749439f.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 Nov 2024 08:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1732726287; x=1733331087; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bza9TXjKrMx+ZuvYZSE+jh++0b0PFp5Y1oO9gfMuvgM=;
        b=rpOzl6OSKJdrJkahBfq4i1HR9nRM0NPQ4/NT8DpwUpir24J+fZrKfGrzihXd1ZVctS
         V4lz2H/XTbRjxtozrhe7MWKwqVdT1o0P0iKy538X7sTySrSj9qsq/OMdtbp/BDD+Rh9w
         8RAceRzkGNZRK/pdofqTS79eJWWHyy3WhzHoN68jIhYtumQyibdxyGseiQh7W65pbjX1
         u4gmHNx5jIWzZMTZI72mDISdZftcVCjz8DdscL/mpw/x2Pe7Qug6BQwVCQVMd4OI3KRm
         2P/Uw5IqKw7oZLEz6X+F0tetd+nNjdfJFy5dLjn7n+QJAMpr/ECPXZp7bD9WpRxwggJ0
         1v+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732726287; x=1733331087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bza9TXjKrMx+ZuvYZSE+jh++0b0PFp5Y1oO9gfMuvgM=;
        b=VWZuOSd3k2gdMTZXOJ9HtlrBQFjYfsrI+mQXhNw6Tc5knx4DEFBJgC1K4cFZH0BR7z
         csNnjm3zBwh9znpND+73D2Z3AOjW9iPcqr2XHajvYPzGGfIj0KormL6kvA38a1chZ/2t
         N5JrFWrZLUS0AKtk8afw9CEH86Gv8RX7KtXlolDcQbeAVDK7nQ9j2gpyzyCqT/mkDjjl
         XxfdXnS+o8YhvvAHOjaZumf/YjZYNZ8ET7WmYZGjXYksSHWTWQckUx+DSReuZeveNHGq
         Ba3mXc5iSV1xybYsHOtG/Z8Z5tfEuwqaqVy3WFukEnVJHPcy+/n7FMBVmwk+QAO6OvIn
         vCCQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6nRq1Cd2HmMAVTS1JtEHUNwD0oNP4LHdVu/gw8EeZ7BEL6rLrHXw7AADyJ1emPd89FlweKWDldOVS8A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0HDgf1u0ZLNLP/iDr9QOikgisKJDY3V509GbvPcy7kOFBhvYQ
	ejOR6q9tZBxpeZ830927xxOOOQUTiTWKmy/Tf/TFCVdI+75D0iQt4OPsfepVluxSuu0iqSMsGB4
	t0tWUiT9oRKkJnpU2jpI4m9IMnORW+VoGYaonzg==
X-Gm-Gg: ASbGncttClcLlZ9REw4wQ7o3dRczyi3KQoUf77mvEmyV5CuFBeGRjeEbvib3E+yXC+G
	0mefUsCmfGiMWEiOVf+Pbda0cs8/WdD1+aA==
X-Google-Smtp-Source: AGHT+IHxvDlHWGRrvsQdmkTyZjkHawKzIvwtz6T9UyKPE9sZ2QFQD9qYyIufn4uqqBrMH/tchj8LjVN4cYc8/GBl11Y=
X-Received: by 2002:a05:6602:6001:b0:843:ea9a:acc4 with SMTP id
 ca18e2360f4ac-843ed0671b8mr429804039f.8.1732726286648; Wed, 27 Nov 2024
 08:51:26 -0800 (PST)
MIME-Version: 1.0
References: <CAAhSdy2mLBzE63wpQrOaHtOV0rwqkaxTUMBA9oMZsk68o0EHMg@mail.gmail.com>
 <CABgObfacuB-8KN1+Czt5DaXQbaiw9=jP5zYGatw6CGooLnz9Sg@mail.gmail.com>
 <CAAhSdy1eYZc__ynDrF8sQCk8Rj+CRj+LBBbGnV+Hc4qHfYiEOA@mail.gmail.com> <CABgObfbKYc0Dqcq36dHsV=uopV+TAGu9-SuZF+QP=u6x0uMiHg@mail.gmail.com>
In-Reply-To: <CABgObfbKYc0Dqcq36dHsV=uopV+TAGu9-SuZF+QP=u6x0uMiHg@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 27 Nov 2024 22:21:15 +0530
Message-ID: <CAAhSdy1QCeg82kQsPHJx1+Oc=L7BoOUTpeLUNoeApao8rZDE+Q@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv changes for 6.13, part #2
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, 
	Atish Patra <atishp@atishpatra.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_085127_606964_60495FA0 
X-CRM114-Status: GOOD (  22.00  )
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

T24gV2VkLCBOb3YgMjcsIDIwMjQgYXQgMTA6MTfigK9QTSBQYW9sbyBCb256aW5pIDxwYm9uemlu
aUByZWRoYXQuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgTm92IDI3LCAyMDI0IGF0IDU6NDTigK9Q
TSBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBXZWQs
IE5vdiAyNywgMjAyNCBhdCAxMDowOOKAr1BNIFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhh
dC5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBUaHUsIE5vdiAyMSwgMjAyNCBhdCAxOjU14oCv
UE0gQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4g
PiBIaSBQYW9sbywKPiA+ID4gPgo+ID4gPiA+IEFzIG1lbnRpb25lZCBpbiB0aGUgbGFzdCBQUiwg
aGVyZSBhcmUgdGhlIHJlbWFpbmluZyBLVk0gUklTQy1WCj4gPiA+ID4gY2hhbmdlcyBmb3IgNi4x
MyB3aGljaCBtYWlubHkgY29uc2lzdHMgb2YgU3ZhZGUvU3ZhZHUgZXh0ZW5zaW9uCj4gPiA+ID4g
c3VwcG9ydCBmb3IgSG9zdCBhbmQgR3Vlc3QvVk0uCj4gPiA+ID4KPiA+ID4gPiBQbGVhc2Ugbm90
ZSB0aGF0IFBhbG1lciBoYXMgbm90IHlldCBzZW50IHRoZSBSSVNDLVYgUFIgZm9yIDYuMTMKPiA+
ID4gPiBzbyB0aGVzZSBwYXRjaGVzIHdpbGwgY29uZmxpY3Qgd2l0aCB0aGUgUklTQy1WIHRyZWUu
Cj4gPiA+Cj4gPiA+IFRoZSBSSVNDLVYgUFIgaGFzIG5vdCBiZWVuIG1lcmdlZCB5ZXQgKGhhcyBp
dCBiZWVuIHNlbnQ/KSBhbmQgSSBhbSBub3QKPiA+ID4gc3VyZSB3aGF0J3MgaGFwcGVuaW5nIGhl
cmUuIElmIHRoZXNlIGFyZSBtZXJnZWQgZmlyc3QsIHByZXN1bWFibHkKPiA+ID4gTGludXMgd2ls
bCBidW1wIHRoZSBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggY29uc3RhbnRzIC0tCj4g
PiA+IGxlYXZpbmcgU1ZBREUvU1ZBRFUgYXQgODcgYW5kIDg4IGFuZCBhZGp1c3RpbmcgdGhlIG90
aGVycy4gU2hvdWxkIEkgZG8KPiA+ID4gdGhhdCBvciBpcyBpdCBkZWxheWVkIHRvIDYuMTQgYXQg
dGhpcyBwb2ludD8KPiA+Cj4gPiBZZXMsIFBhbG1lciBzZW5kLW91dCBSSVNDLVYgUFIgb25lIGhv
dXIgYWdvLgo+ID4gKHN1YmplY3QgIltHSVQgUFVMTF0gUklTQy1WIFBhY2hlcyBmb3IgdGhlIDYu
MTMgTWVyZ2UgV2luZG93LCBQYXJ0IDEiKQo+ID4gKGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC9yaXNjdi9saW51eC5naXQKPiA+IHRhZ3MvcmlzY3YtZm9yLWxp
bnVzLTYuMTMtbXcxKQo+ID4KPiA+IFdlIGhhdmUgYWxyZWFkeSBza2lwcGVkIFN2YWRlICYgU3Zh
ZHUgc3VwcG9ydCBpbiB0aGUgNi4xMiBtZXJnZQo+ID4gd2luZG93LiBJZiBwb3NzaWJsZSBwbGVh
c2UgdGFrZSBpdCBpbiB0aGlzIG1lcmdlIHdpbmRvdy4KPgo+IE9rLCB3aWxsIGRvLiBCdXQgSSdk
IGxpa2UgdG8gdW5kZXJzdGFuZCBpZiBLVk0gcGF0Y2hlcyBuZWVkZWQgdGhlIGJhcmUKPiBtZXRh
bCBzdXBwb3J0LiBJZiBub3QsIGFuZCB0aGUgb25seSByZWFzb24gdG8gc2tpcCBpdCBpbiA2LjEy
IHdhcyB0aGUKPiBod2NhcC5oIGNvbnN0YW50cywgdGhlbiB0aGVyZSB3YXMgbm8gcmVhc29uIHRv
IGRlbGF5IGl0LiBKdXN0IHNlbmQgdGhlCj4gaHdjYXAuaCB1cGRhdGUgYXMgYSBwdWxsIHJlcXVl
c3QgdG8gYm90aCBtZSBhbmQgUGFsbWVyLCBhbmQgd2UnbGwKPiBtZXJnZSBpdCBmcm9tIHRoZSBz
YW1lIGNvbW1pdCBpbnRvIG91ciB0cmVlcy4KCkl0IHdhcyBza2lwcGVkIGluIDYuMTIgZHVlIHRv
IGNvbmZ1c2lvbiBiZXR3ZWVuIG15c2VsZiBhbmQgUGFsbWVyCmFib3V0IHdoaWNoIHRyZWUgdGhl
c2UgcGF0Y2hlcyB3aWxsIGdvIHRocm91Z2ggYW5kIHdlIGRpZCBub3QgcmVzb2x2ZQp0aGlzIGlu
IHRpbWUuCgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
