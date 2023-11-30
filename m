Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F16C4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 12:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3LoKveYZDyOESF+BjPwEwu6817kmQe2LtP14WCF41GA=; b=nhn4VYfHK9Mr/K
	fCpNboG7FI80y0dgZ933Rp/vhoJofd5chXhLZmtH/z/8XRyXKEXEtq0mlom5ZcxX28veoHisbHnR2
	GUpe6+yaNzPV7TTPwO/f83rrJ25JGTjNz49X3ArM9T7qg56eiYI4HZn/6x8/pmUVUl/bBfnofRH4s
	SuiDtpko/A1j8RU8XLbcuiXuWFbCjD09lxScJSO9jlvPm1Go+mVc+Wgy9IwHmZN3/glKFhhmU3Hu1
	Vezuzl5Yx48459cde+w6ssepisjDQzj+di8wU2cRe5gwbulRpdxnUZrkhaPh+PFZyw51C/UM/ohVS
	bQzcptqJemhHOdvV+4Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8gau-00Av9P-0D;
	Thu, 30 Nov 2023 12:56:40 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8gaq-00Av90-1h
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 12:56:38 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-332fd78fa9dso567535f8f.3
        for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 04:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701348994; x=1701953794; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kyD+yl2bHZjrxQ6uqMRfoBj0ywuOG/6z0iIPw0pQbBM=;
        b=hOvSVgkccwR7jjFW7P66fRQcbAp+Q+xqbJm+uRRAtIhF4AKuzuW/d9NfiUki85drI9
         Pej3orme0nSgyPCWgJWFkHfsVTFKh5Qk4iGJsDPm472eikU1Iozs0tcwv34dEhpN+hSu
         xgWj/j2dtpGapqpoATKGGSUDJWNAJb9nFeTOZTakmyZTWBuX/0q4mIVVePntTtcUrXcf
         98UCk/RaPwl2tGmBMM0g6ySbiR7i91mR1mcbsurGn2eTPTubMOOepyKy8LwDEJA9aqC0
         MfjOLZ6UwK77CnIIRnrdjVbkPGB3ndxgTA5PnrSSed6oDwbBDsb+jPUmh8sVZsizI1YD
         VOwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701348994; x=1701953794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kyD+yl2bHZjrxQ6uqMRfoBj0ywuOG/6z0iIPw0pQbBM=;
        b=nWGe807qEKC/wNd2levtM0lySqBS55B/XmAuU5HIq4UDO/b8tQXxR8Xprt52L/b4+E
         6MSMVhYasIvTUO18iY3BdkesLTrcbk4whegeoY1uvZ0qysvtI1suuNkbswAqK88ptOGs
         JmSZIHqq761sXOyyuJnV3sWsakJy2Fz/PcOGXN3t86F4ACQYpQGAkYCf1A8jk7ZmKJxt
         yi4nABDKi6/zOHrnmP616pjL9aPh7voOaDgObce6SfQAM1W5KbxHXxmyyg9R63uBLt7k
         4RI1+YQGlsBRzhxarLYHG5V3aK6bv3KcPlWjKGp+gK1Ih5+cg2SYHObnMDZKAYAAbeAn
         NRVw==
X-Gm-Message-State: AOJu0YxMe3eOjh7R27iXsDM4KoQssWwZVpuj+9hX0GLrolyCfQFCMsaL
	5RIINVUtZF+6KZUBzpajp9w=
X-Google-Smtp-Source: AGHT+IH7MbMZQhB4klE0BbfdgOc2EVNygz66QSdNWQ8VAEJy9K365/fx1q+fEAVewBWf1IDSVP1Hzw==
X-Received: by 2002:adf:e841:0:b0:333:179:d8ef with SMTP id d1-20020adfe841000000b003330179d8efmr7830573wrn.24.1701348993691;
        Thu, 30 Nov 2023 04:56:33 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2500:a01:3c2e:cd45:f50f:f083])
        by smtp.gmail.com with ESMTPSA id t9-20020a5d6a49000000b0033172f984eesm1488463wrw.50.2023.11.30.04.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 04:56:33 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Yu Chien Peter Lin <peterlin@andestech.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2] riscv: errata: andes: Probe for IOCP only once in boot stage
Date: Thu, 30 Nov 2023 12:56:06 +0000
Message-Id: <20231130125606.64931-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_045636_570367_61E02B95 
X-CRM114-Status: GOOD (  14.61  )
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

RnJvbTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMu
Y29tPgoKV2UgbmVlZCB0byBwcm9iZSBmb3IgSU9DUCBvbmx5IG9uY2UgZHVyaW5nIGJvb3Qgc3Rh
Z2UsIGFzIHdlIHdlcmUgcHJvYmluZwpmb3IgSU9DUCBmb3IgYWxsIHRoZSBzdGFnZXMgdGhpcyBj
YXVzZWQgdGhlIGJlbG93IGlzc3VlIGR1cmluZyBtb2R1bGUtaW5pdApzdGFnZSwKCls5LjAxOTEw
NF0gVW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgcGFnaW5nIHJlcXVlc3QgYXQgdmlydHVhbCBhZGRy
ZXNzIGZmZmZmZmZmODEwMGQzYTAKWzkuMDI3MTUzXSBPb3BzIFsjMV0KWzkuMDI5NDIxXSBNb2R1
bGVzIGxpbmtlZCBpbjogcmNhcl9jYW5mZCByZW5lc2FzX3VzYmhzIGkyY19yaWljIGNhbl9kZXYg
c3BpX3JzcGkgaTJjX2NvcmUKWzkuMDM3Njg2XSBDUFU6IDAgUElEOiA5MCBDb21tOiB1ZGV2ZCBO
b3QgdGFpbnRlZCA2LjcuMC1yYzErICM1NwpbOS4wNDM3NTZdIEhhcmR3YXJlIG5hbWU6IFJlbmVz
YXMgU01BUkMgRVZLIGJhc2VkIG9uIHI5YTA3ZzA0M2YwMSAoRFQpCls5LjA1MDMzOV0gZXBjIDog
cmlzY3Zfbm9uY29oZXJlbnRfc3VwcG9ydGVkKzB4MTAvMHgzZQpbOS4wNTU1NThdIMKgcmEgOiBh
bmRlc19lcnJhdGFfcGF0Y2hfZnVuYysweDRhLzB4NTIKWzkuMDYwNDE4XSBlcGMgOiBmZmZmZmZm
ZjgwMDBkOGMyIHJhIDogZmZmZmZmZmY4MDAwZDk1YyBzcCA6IGZmZmZmZmM4MDAzYWJiMDAKWzku
MDY3NjA3XSDCoGdwIDogZmZmZmZmZmY4MTRlMjVhMCB0cCA6IGZmZmZmZmQ4MDM2MWU1NDAgdDAg
OiAwMDAwMDAwMDAwMDAwMDAwCls5LjA3NDc5NV0gwqB0MSA6IDAwMDAwMDAwMDkwMDAzMWUgdDIg
OiAwMDAwMDAwMDAwMDAwMDAxIHMwIDogZmZmZmZmYzgwMDNhYmIyMApbOS4wODE5ODRdIMKgczEg
OiBmZmZmZmZmZjAxNWI1N2M3IGEwIDogMDAwMDAwMDAwMDAwMDAwMCBhMSA6IDAwMDAwMDAwMDAw
MDAwMDEKWzkuMDg5MTcyXSDCoGEyIDogMDAwMDAwMDAwMDAwMDAwMCBhMyA6IDAwMDAwMDAwMDAw
MDAwMDAgYTQgOiBmZmZmZmZmZjgxMDBkOGJlCls5LjA5NjM2MF0gwqBhNSA6IDAwMDAwMDAwMDAw
MDAwMDEgYTYgOiAwMDAwMDAwMDAwMDAwMDAxIGE3IDogMDAwMDAwMDAwOTAwMDMxZQpbOS4xMDM1
NDhdIMKgczIgOiBmZmZmZmZmZjAxNWI1N2Q3IHMzIDogMDAwMDAwMDAwMDAwMDAwMSBzNCA6IDAw
MDAwMDAwMDAwMDAzMWUKWzkuMTEwNzM2XSDCoHM1IDogODAwMDAwMDAwMDAwOGE0NSBzNiA6IDAw
MDAwMDAwMDAwMDA1MDAgczcgOiAwMDAwMDAwMDAwMDAwMDNmCls5LjExNzkyNF0gwqBzOCA6IGZm
ZmZmZmM4MDAzYWJkNDggczkgOiBmZmZmZmZmZjAxNWIxMTQwIHMxMDogZmZmZmZmZmY4MTUxYTFi
MApbOS4xMjUxMTNdIMKgczExOiBmZmZmZmZmZjAxNWIxMDAwIHQzIDogMDAwMDAwMDAwMDAwMDAw
MSB0NCA6IGZlZmVmZWZlZmVmZWZlZmYKWzkuMTMyMzAxXSDCoHQ1IDogZmZmZmZmZmYwMTViNTdj
NyB0NiA6IGZmZmZmZmQ4YjYzYTYwMDAKWzkuMTM3NTg3XSBzdGF0dXM6IDAwMDAwMDAyMDAwMDAx
MjAgYmFkYWRkcjogZmZmZmZmZmY4MTAwZDNhMCBjYXVzZTogMDAwMDAwMDAwMDAwMDAwZgpbOS4x
NDU0NjhdIFs8ZmZmZmZmZmY4MDAwZDhjMj5dIHJpc2N2X25vbmNvaGVyZW50X3N1cHBvcnRlZCsw
eDEwLzB4M2UKWzkuMTUxOTcyXSBbPGZmZmZmZmZmODAwMDI3ZTg+XSBfYXBwbHlfYWx0ZXJuYXRp
dmVzKzB4ODQvMHg4NgpbOS4xNTc3ODRdIFs8ZmZmZmZmZmY4MDAwMjliZT5dIGFwcGx5X21vZHVs
ZV9hbHRlcm5hdGl2ZXMrMHgxMC8weDFhCls5LjE2NDExM10gWzxmZmZmZmZmZjgwMDA4ZmNjPl0g
bW9kdWxlX2ZpbmFsaXplKzB4NWUvMHg3YQpbOS4xNjk1ODNdIFs8ZmZmZmZmZmY4MDA4NWNkNj5d
IGxvYWRfbW9kdWxlKzB4ZmQ4LzB4MTc5YwpbOS4xNzQ5NjVdIFs8ZmZmZmZmZmY4MDA4NjYzMD5d
IGluaXRfbW9kdWxlX2Zyb21fZmlsZSsweDc2LzB4YWEKWzkuMTgwOTQ4XSBbPGZmZmZmZmZmODAw
ODY3ZjY+XSBfX3Jpc2N2X3N5c19maW5pdF9tb2R1bGUrMHgxNzYvMHgyYTgKWzkuMTg3MzY1XSBb
PGZmZmZmZmZmODA4ODk4NjI+XSBkb190cmFwX2VjYWxsX3UrMHhiZS8weDEzMApbOS4xOTI5MjJd
IFs8ZmZmZmZmZmY4MDg5MjBiYz5dIHJldF9mcm9tX2V4Y2VwdGlvbisweDAvMHg2NApbOS4xOTg1
NzNdIENvZGU6IDAwMDkgYjdlOSA2Nzk3IDAxNGQgYTc4MyA4NWE3IGM3OTkgNDc4NSAwNzE3IDAx
MDAgKDAxMjMpIGFlZjcKWzkuMjA1OTk0XSAtLS1bIGVuZCB0cmFjZSAwMDAwMDAwMDAwMDAwMDAw
IF0tLS0KClRoaXMgaXMgYmVjYXVzZSB3ZSBjYWxsZWQgcmlzY3Zfbm9uY29oZXJlbnRfc3VwcG9y
dGVkKCkgZm9yIGFsbCB0aGUgc3RhZ2VzCmR1cmluZyBJT0NQIHByb2JlLiByaXNjdl9ub25jb2hl
cmVudF9zdXBwb3J0ZWQoKSBmdW5jdGlvbiBzZXRzCm5vbmNvaGVyZW50X3N1cHBvcnRlZCB2YXJp
YWJsZSB0byB0cnVlIHdoaWNoIGhhcyBhbiBhbm5vdGF0aW9uIHNldCB0bwoiX19yb19hZnRlcl9p
bml0IiBkdWUgdG8gd2hpY2ggd2Ugd2VyZSBzZWVpbmcgdGhlIGFib3ZlIHNwbGF0LiBGaXggdGhp
cyBieQpwcm9iaW5nIGZvciBJT0NQIG9ubHkgb25jZSBpbiBib290IHN0YWdlIGJ5IGhhdmluZyBh
IGJvb2xlYW4gdmFyaWFibGUKaXNfaW9jcF9wcm9iZV9kb25lIHdoaWNoIHdpbGwgYmUgc2V0IHRv
IHRydWUgdXBvbiBJT0NQIHByb2JlIGluCmVycmF0YV9wcm9iZV9pb2NwKCkgYW5kIHdlIGJhaWwg
b3V0IGVhcmx5IGlmIGlzX2lvY3BfcHJvYmVfZG9uZSBpcyBzZXQuCgpXaGlsZSBhdCBpdCBtYWtl
IHJldHVybiB0eXBlIG9mIGVycmF0YV9wcm9iZV9pb2NwKCkgdG8gdm9pZCBhcyB3ZSB3ZXJlCm5v
dCBjaGVja2luZyB0aGUgcmV0dXJuIHZhbHVlIGluIGFuZGVzX2VycmF0YV9wYXRjaF9mdW5jKCku
CgpGaXhlczogZTAyMWFlN2Y1MTQ1ICgicmlzY3Y6IGVycmF0YTogQWRkIEFuZGVzIGFsdGVybmF0
aXZlIHBvcnRzIikKU2lnbmVkLW9mZi1ieTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFk
ZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPgotLS0KdjEtPnYyCiogQXMgUklTQ1ZfQUxURVJOQVRJ
VkVTX0JPT1Qgc3RhZ2UgY2FuIGhhcHBlbiB0d2ljZSBhZGQgYSBpc19pb2NwX3Byb2JlX2RvbmUK
ICB2YXJpYWJsZSB0byBwcm9iZSBmb3IgSU9DUCBvbmx5IG9uY2UuCiogVXBkYXRlZCBjb21taXQg
bWVzc2FnZQoqIE1ha2UgcmV0dXJuIHZhbHVlIG9mIGVycmF0YV9wcm9iZV9pb2NwKCkgdG8gdm9p
ZAotLS0KIGFyY2gvcmlzY3YvZXJyYXRhL2FuZGVzL2VycmF0YS5jIHwgMjMgKysrKysrKysrKysr
KysrLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvZXJyYXRhL2FuZGVzL2VycmF0YS5jIGIvYXJj
aC9yaXNjdi9lcnJhdGEvYW5kZXMvZXJyYXRhLmMKaW5kZXggMTk3ZGI2OGNjOGRhLi5iOGVhZGIz
YjEwZDggMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvZXJyYXRhL2FuZGVzL2VycmF0YS5jCisrKyBi
L2FyY2gvcmlzY3YvZXJyYXRhL2FuZGVzL2VycmF0YS5jCkBAIC0zOCwyOSArMzgsMzYgQEAgc3Rh
dGljIGxvbmcgYXg0NW1wX2lvY3Bfc3dfd29ya2Fyb3VuZCh2b2lkKQogCXJldHVybiByZXQuZXJy
b3IgPyAwIDogcmV0LnZhbHVlOwogfQogCi1zdGF0aWMgYm9vbCBlcnJhdGFfcHJvYmVfaW9jcCh1
bnNpZ25lZCBpbnQgc3RhZ2UsIHVuc2lnbmVkIGxvbmcgYXJjaF9pZCwgdW5zaWduZWQgbG9uZyBp
bXBpZCkKK3N0YXRpYyB2b2lkIGVycmF0YV9wcm9iZV9pb2NwKHVuc2lnbmVkIGludCBzdGFnZSwg
dW5zaWduZWQgbG9uZyBhcmNoX2lkLCB1bnNpZ25lZCBsb25nIGltcGlkKQogeworCXN0YXRpYyBi
b29sIGlzX2lvY3BfcHJvYmVfZG9uZTsKKwogCWlmICghSVNfRU5BQkxFRChDT05GSUdfRVJSQVRB
X0FOREVTX0NNTykpCi0JCXJldHVybiBmYWxzZTsKKwkJcmV0dXJuOworCisJaWYgKGlzX2lvY3Bf
cHJvYmVfZG9uZSkKKwkJcmV0dXJuOwogCiAJaWYgKGFyY2hfaWQgIT0gQU5ERVNURUNIX0FYNDVN
UF9NQVJDSElEIHx8IGltcGlkICE9IEFOREVTVEVDSF9BWDQ1TVBfTUlNUElEKQotCQlyZXR1cm4g
ZmFsc2U7CisJCXJldHVybjsKIAotCWlmICghYXg0NW1wX2lvY3Bfc3dfd29ya2Fyb3VuZCgpKQot
CQlyZXR1cm4gZmFsc2U7CisJaWYgKCFheDQ1bXBfaW9jcF9zd193b3JrYXJvdW5kKCkpIHsKKwkJ
aXNfaW9jcF9wcm9iZV9kb25lID0gdHJ1ZTsKKwkJcmV0dXJuOworCX0KIAogCS8qIFNldCB0aGlz
IGp1c3QgdG8gbWFrZSBjb3JlIGNibyBjb2RlIGhhcHB5ICovCiAJcmlzY3ZfY2JvbV9ibG9ja19z
aXplID0gMTsKIAlyaXNjdl9ub25jb2hlcmVudF9zdXBwb3J0ZWQoKTsKLQotCXJldHVybiB0cnVl
OworCWlzX2lvY3BfcHJvYmVfZG9uZSA9IHRydWU7CiB9CiAKIHZvaWQgX19pbml0X29yX21vZHVs
ZSBhbmRlc19lcnJhdGFfcGF0Y2hfZnVuYyhzdHJ1Y3QgYWx0X2VudHJ5ICpiZWdpbiwgc3RydWN0
IGFsdF9lbnRyeSAqZW5kLAogCQkJCQkgICAgICB1bnNpZ25lZCBsb25nIGFyY2hpZCwgdW5zaWdu
ZWQgbG9uZyBpbXBpZCwKIAkJCQkJICAgICAgdW5zaWduZWQgaW50IHN0YWdlKQogewotCWVycmF0
YV9wcm9iZV9pb2NwKHN0YWdlLCBhcmNoaWQsIGltcGlkKTsKKwlpZiAoc3RhZ2UgPT0gUklTQ1Zf
QUxURVJOQVRJVkVTX0JPT1QpCisJCWVycmF0YV9wcm9iZV9pb2NwKHN0YWdlLCBhcmNoaWQsIGlt
cGlkKTsKIAogCS8qIHdlIGhhdmUgbm90aGluZyB0byBwYXRjaCBoZXJlIEFUTSBzbyBqdXN0IHJl
dHVybiBiYWNrICovCiB9Ci0tIAoyLjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
