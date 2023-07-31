Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB15C001DE
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 11:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nLAqyjEK9ZMo/8ZI/oepAbgtrIST8WiqeQoNyHUElHc=; b=EWGjUtlFqtp5tL
	wbSawKxS3biyrZbGXNKOv7Tkl+WSWZRzBaHHqzJ/m0rgzuTh0ubvvJvyEm0jcZfq5vPEuB/NzdvaV
	MNipZ5XtR47T2cqvuN1PLgCoUc2BHn/wxVSMHf9/PZx+HTqvJSpXG2ciSn/LOIKOXV7uBGT4tj/u7
	Je67GukmSIfeWGuZgL7zpaMoEIzDPLSUvDbR4LhAcdZWJZHgcO1MfYsImT7V/x3Z7+aP7kABlw9Nn
	HHm0JaQ8t6rPf7gkJlSzNCOngUBKI/bheVpLFUlcaPbrRNO6s6e6IEveC+o2w8Nwxw+9/elxo17yQ
	3nvmeAidKBF41NAUiSxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQR3j-00FKYx-06;
	Mon, 31 Jul 2023 11:27:31 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQR3f-00FKXY-1V
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 11:27:29 +0000
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-785d738d3feso101014939f.0
        for <linux-riscv@lists.infradead.org>; Mon, 31 Jul 2023 04:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690802845; x=1691407645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iJH1cy35Z/dyiXUx/UDotPeNv2Pad/0I0FqjA2xNQj4=;
        b=plT+MBU3MkIi3vHhGqYT2gFxn21ipFMcDu9L6V5v+UgoVt4UGJlSS7WtHGYB9h0nCj
         K6BDb8/scVUG8sgmvxsf473s58PVntywrvrJHDMQHkO8CGZETtaK4iE7wdHqOWGFYMWb
         MVn58+aWvHr5jLaUMglvUC1usTA0tefQBkfTsQFOBeEtvI7LbH0CVX1VX4ltOdZSBzgP
         XyS7LBYth80zcJMyJoJsTq+GKr/Wk4wgEbT/0ZibfTgEcO5kTKopATwBVvF+DlC/+KwM
         76UXLEgiIpIZUKDz7HObHG8ua0xBkPlIf8PrQubuFj+cXtEjBWotJSQPAbc2jZ+ys/Ga
         fFtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690802845; x=1691407645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iJH1cy35Z/dyiXUx/UDotPeNv2Pad/0I0FqjA2xNQj4=;
        b=XS5+QV1P6mUmHqFe6wMpqamq/Dsdvh1cChpqS8+e0fKXeA4deAU3PoMLzVAR+ybzCC
         X6Xs2H1wmteJt+LHJYhwLhAVNft4mQyHTV6MqoVfj9WP5IQ5NuKx7ObiZcpiGNftzMM9
         prykBymEKZOAjsAKEPdmXbBDlqTM3QxgJkSg8dmVDA8+bODhp2OLpU64mlurWzAz1QI1
         eiiIzpCVfmNc7NBosi7L2Dwvp7OltQ2Fv/8Oy8V/PPuvg8wPAyv0IZNZX9/Ql2A42qss
         Rwo3a6zi47yXfT+/JfJRLE/KNKfgS0OABaFTztSd/hTklVt3HyyyXTclnbi3/pZ+tMwt
         odIg==
X-Gm-Message-State: ABy/qLbfl/JQH9r1aCc2vd7SsQixpi9RbRNCwgVyOPz92r4VWPJsUgZR
	dtYcLPJGbQl8OW9EilEGUfZivqQvNOBGF0PmEWA=
X-Google-Smtp-Source: APBJJlFvcDToSfHeWegIEU1VJdujozidStMyByOJkqqLgCYOoaaGH8Byv1gTZSQBK2JEi+qxz0zW1JwCFmuUi8UtLA8=
X-Received: by 2002:a05:6602:381:b0:783:4135:5b96 with SMTP id
 f1-20020a056602038100b0078341355b96mr8488367iov.5.1690802844941; Mon, 31 Jul
 2023 04:27:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230702203429.237615-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230702203429.237615-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAJM55Z_ZoKY5A6icpkZo+U5JQ5rMfNmCWz35EJ9RrH7bEgv53g@mail.gmail.com>
In-Reply-To: <CAJM55Z_ZoKY5A6icpkZo+U5JQ5rMfNmCWz35EJ9RrH7bEgv53g@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 31 Jul 2023 12:26:58 +0100
Message-ID: <CA+V-a8t=R1EoEei_q6S9nsTyo9wNZwuvMOcCOJhrWPbG=XDxZg@mail.gmail.com>
Subject: Re: [PATCH v10 5/6] cache: Add L2 cache management for Andes AX45MP
 RISC-V core
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Conor Dooley <conor.dooley@microchip.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Guo Ren <guoren@kernel.org>, 
	Andrew Jones <ajones@ventanamicro.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Samuel Holland <samuel@sholland.org>, linux-riscv@lists.infradead.org, 
	Christoph Hellwig <hch@infradead.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_042727_508784_B946F6F1 
X-CRM114-Status: GOOD (  22.05  )
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

SGkgRW1pbCwKClRoYW5rIHlvdSBmb3IgdGhlIHJldmlldy4KCk9uIE1vbiwgSnVsIDMxLCAyMDIz
IGF0IDk6NTPigK9BTSBFbWlsIFJlbm5lciBCZXJ0aGluZwo8ZW1pbC5yZW5uZXIuYmVydGhpbmdA
Y2Fub25pY2FsLmNvbT4gd3JvdGU6Cj4KPiBPbiBTdW4sIDIgSnVsIDIwMjMgYXQgMjI6MzcsIFBy
YWJoYWthciA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IEZyb206
IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4K
PiA+Cj4gPiBJL08gQ29oZXJlbmNlIFBvcnQgKElPQ1ApIHByb3ZpZGVzIGFuIEFYSSBpbnRlcmZh
Y2UgZm9yIGNvbm5lY3RpbmcKPiA+IGV4dGVybmFsIG5vbi1jYWNoaW5nIG1hc3RlcnMsIHN1Y2gg
YXMgRE1BIGNvbnRyb2xsZXJzLiBUaGUgYWNjZXNzZXMKPiA+IGZyb20gSU9DUCBhcmUgY29oZXJl
bnQgd2l0aCBELUNhY2hlcyBhbmQgTDIgQ2FjaGUuCj4gPgo+ID4gSU9DUCBpcyBhIHNwZWNpZmlj
YXRpb24gb3B0aW9uIGFuZCBpcyBkaXNhYmxlZCBvbiB0aGUgUmVuZXNhcyBSWi9GaXZlCj4gPiBT
b0MgZHVlIHRvIHRoaXMgcmVhc29uIElQIGJsb2NrcyB1c2luZyBETUEgd2lsbCBmYWlsLgo+ID4K
PiA+IFRoZSBBbmRlcyBBWDQ1TVAgY29yZSBoYXMgYSBQcm9ncmFtbWFibGUgUGh5c2ljYWwgTWVt
b3J5IEF0dHJpYnV0ZXMgKFBNQSkKPiA+IGJsb2NrIHRoYXQgYWxsb3dzIGR5bmFtaWMgYWRqdXN0
bWVudCBvZiBtZW1vcnkgYXR0cmlidXRlcyBpbiB0aGUgcnVudGltZS4KPiA+IEl0IGNvbnRhaW5z
IGEgY29uZmlndXJhYmxlIGFtb3VudCBvZiBQTUEgZW50cmllcyBpbXBsZW1lbnRlZCBhcyBDU1IK
PiA+IHJlZ2lzdGVycyB0byBjb250cm9sIHRoZSBhdHRyaWJ1dGVzIG9mIG1lbW9yeSBsb2NhdGlv
bnMgaW4gaW50ZXJlc3QuCj4gPiBCZWxvdyBhcmUgdGhlIG1lbW9yeSBhdHRyaWJ1dGVzIHN1cHBv
cnRlZDoKPiA+ICogRGV2aWNlLCBOb24tYnVmZmVyYWJsZQo+ID4gKiBEZXZpY2UsIGJ1ZmZlcmFi
bGUKPiA+ICogTWVtb3J5LCBOb24tY2FjaGVhYmxlLCBOb24tYnVmZmVyYWJsZQo+ID4gKiBNZW1v
cnksIE5vbi1jYWNoZWFibGUsIEJ1ZmZlcmFibGUKPiA+ICogTWVtb3J5LCBXcml0ZS1iYWNrLCBO
by1hbGxvY2F0ZQo+ID4gKiBNZW1vcnksIFdyaXRlLWJhY2ssIFJlYWQtYWxsb2NhdGUKPiA+ICog
TWVtb3J5LCBXcml0ZS1iYWNrLCBXcml0ZS1hbGxvY2F0ZQo+ID4gKiBNZW1vcnksIFdyaXRlLWJh
Y2ssIFJlYWQgYW5kIFdyaXRlLWFsbG9jYXRlCj4gPgo+ID4gTW9yZSBpbmZvIGFib3V0IFBNQSAo
c2VjdGlvbiAxMC4zKToKPiA+IExpbms6IGh0dHA6Ly93d3cuYW5kZXN0ZWNoLmNvbS93cC1jb250
ZW50L3VwbG9hZHMvQVg0NU1QLTFDLVJldi4tNS4wLjAtRGF0YXNoZWV0LnBkZgo+ID4KPiA+IEFz
IGEgd29ya2Fyb3VuZCBmb3IgU29DcyB3aXRoIElPQ1AgZGlzYWJsZWQgQ01PIG5lZWRzIHRvIGJl
IGhhbmRsZWQgYnkKPiA+IHNvZnR3YXJlLiBGaXJzdGx5IE9wZW5TQkkgY29uZmlndXJlcyB0aGUg
bWVtb3J5IHJlZ2lvbiBhcwo+ID4gIk1lbW9yeSwgTm9uLWNhY2hlYWJsZSwgQnVmZmVyYWJsZSIg
YW5kIHBhc3NlcyB0aGlzIHJlZ2lvbiBhcyBhIGdsb2JhbAo+ID4gc2hhcmVkIGRtYSBwb29sIGFz
IGEgRFQgbm9kZS4gV2l0aCBETUFfR0xPQkFMX1BPT0wgZW5hYmxlZCBhbGwgRE1BCj4gPiBhbGxv
Y2F0aW9ucyBoYXBwZW4gZnJvbSB0aGlzIHJlZ2lvbiBhbmQgc3luY2hyb25pemF0aW9uIGNhbGxi
YWNrcyBhcmUKPiA+IGltcGxlbWVudGVkIHRvIHN5bmNocm9uaXplIHdoZW4gZG9pbmcgRE1BIHRy
YW5zYWN0aW9ucy4KPiA+CjxzbmlwPgo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgcmlzY3ZfY2Fj
aGVfb3BzIGF4NDVtcF9jbW9fb3BzID0gewo+ID4gKyAgICAgICAud2JhY2sgPSAmYXg0NW1wX2Rt
YV9jYWNoZV93YmFjaywKPiA+ICsgICAgICAgLmludiA9ICZheDQ1bXBfZG1hX2NhY2hlX2ludiwK
PiA+ICsgICAgICAgLndiYWNrX2ludiA9ICZheDQ1bXBfZG1hX2NhY2hlX3diYWNrX2ludiwKPiA+
ICt9Owo+Cj4gSGkgUHJhYmhha2FyLAo+Cj4gSWYgeW91J3JlIHJlc3Bpbm5pbmcgdGhpcyBwYXRj
aHNldCBhbnl3YXksIEkgdGhpbmsgeW91IGNhbiBtYXJrIHRoaXMKPiBzdHJ1Y3QgYXMgX19pbml0
ZGF0YSBzaW5jZSBpdCdzIG9ubHkgdXNlZCBieQo+IHJpc2N2X25vbmNvaGVyZW50X3JlZ2lzdGVy
X2NhY2hlX29wcyB3aGljaCBjb3BpZXMgdGhlIGNvbnRlbnRzLgo+CkFncmVlZCwgSSB3aWxsIHVw
ZGF0ZSBpdCBpbiB0aGUgbmV4dCB2ZXJzaW9uLgoKQ2hlZXJzLApQcmFiaGFrYXIKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
