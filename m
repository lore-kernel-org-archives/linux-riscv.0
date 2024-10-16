Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6FC5D206A0
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 07:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JDLuN8TFwnusP/243eKYNQKjmpfY6MCZfGvkC4vyAJ4=; b=aX7kCE0+Ef6qyy
	tbqkGoaSo4DBEU+v9insrIUTqH1sZrB74wxQb4n4hTkCf9HGhN2OYdJn7esCD3E7xPPs1trpENZLa
	tv79VPAqHpKEKYlcJ5Oy70ZIO6mz73wy+ct3kKi6zSGItqKTqSaEF9l/5DbSWToelidg1oriBnm/1
	U6YY72Z7pUohV5HD1/2igL3IpIfK8JkzkJ3A5PWb+Qelw9qZJZ1m7m8EIK5yIJmLSaJv7r/F+fKS6
	BxXCinsnfiWhNzzCHxMUF1RV4P1hHk2U8b7eJBKdyu5JB0JbENHC+YaZsosvlE63AKs4gRctd/Q+9
	MZFFspeoZgZ6OA1nF5Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0y1Z-0000000AlS0-42uP;
	Wed, 16 Oct 2024 07:00:49 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0xtT-0000000AjmT-3QH3
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 06:52:29 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-7e6cbf6cd1dso4326628a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 15 Oct 2024 23:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1729061547; x=1729666347; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=edrP7O7a6NncjkyeVVAJ0jiJhAYB2+mktJx+SnmTMmo=;
        b=DvNOTmHRvVNEB4Oh3D0kBRaZYLHP0AwLzysm0gXly379maJpYAYjmRTWo/kGOPB1KZ
         UVFUS0sTsAJuslQ6ahUKuirHwIaK0xI8UJA4wwWtiBDNCyKMo13h90Rct6BFxy33GI6G
         YdQxn40sDHs+QchJaKIjLIsMUImRLjjCjXXKkL+WCUvBSfk1HrKJdTMllxDNPmqkobZz
         AdSmIEf37xZderOEJ9XYAFo2OcgUFT5MVfvofLc75dZffmxAeJsHZqIdVstjuHU9+BaL
         EPLVXExzGlgC3129V4lB0tXk54oTCiCta5ZsoIe5+nitlEy26xZz8YlhP8kxhFqn4sp5
         KfKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729061547; x=1729666347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=edrP7O7a6NncjkyeVVAJ0jiJhAYB2+mktJx+SnmTMmo=;
        b=cx8n6XMbIjAcrwPZb0kfUUkg4MFL84K1ueR1ClS4QQ6pyTgA6FDFodSYnMvRHkxozx
         TcaZIi6Siw7rr9EUBMvLHJB+TGKEJr27Ivu7SAT3CmV3vHUp/+tagCZhG75UDl2VEWnv
         c5C2aqHjuCch6Pitz/H98MECLK2IFSy4bc+vHrvBOR7+Yp1Tpf3Wz9GfoslX7bka7I68
         2p1CyBS3NXUd4ZDo8ji3LUbio2pO1CDnirCGUnZXwQgyCO8i9RKkwWCtUFyeDYBPEDM6
         b0kbadeoTiTXubFXHpExQ034mLoulWojaFsQNGmqIsEy/dhSRDmk0CZfK5bF9srg7Jiw
         TZCA==
X-Forwarded-Encrypted: i=1; AJvYcCVFmY5aQYj8UvvtR/BACGB5m+34Xpr3nihIHQDLqCBmxiHNGVqa+wMpnT5ueYATU3W6PFchxf/lKM4ygg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy70UkcXOveHXeCJOpgSfXYSDAHKVM5+OMMSRbofNAs8CzbJagy
	eo5FmCfspgQIxeawXceQStKsC+hw9v3dapfK2bSSJ7lOP/h8odcIm0dtYjYgIbI=
X-Google-Smtp-Source: AGHT+IHFpMiQBbiEBTkmPNQuDjgrwQrsX5LcLAK0wa6OKlIr/7npj2NUGYvuYiUcx/vU1hhIAlG0YA==
X-Received: by 2002:a05:6a20:c888:b0:1d0:3a32:c3f8 with SMTP id adf61e73a8af0-1d8bcfaa0ffmr23847001637.39.1729061546751;
        Tue, 15 Oct 2024 23:52:26 -0700 (PDT)
Received: from tjeznach.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e77370a83sm2410762b3a.5.2024.10.15.23.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 23:52:26 -0700 (PDT)
From: Tomasz Jeznach <tjeznach@rivosinc.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v10 0/7] Linux RISC-V IOMMU Support
Date: Tue, 15 Oct 2024 23:52:12 -0700
Message-Id: <cover.1729059707.git.tjeznach@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_235227_894078_D21A6D9C 
X-CRM114-Status: GOOD (  15.74  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Tomasz Jeznach <tjeznach@rivosinc.com>, linux@rivosinc.com, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

VGhpcyBwYXRjaCBzZXJpZXMgaW50cm9kdWNlcyBzdXBwb3J0IGZvciBSSVNDLVYgSU9NTVUgYXJj
aGl0ZWN0ZWQKaGFyZHdhcmUgaW50byB0aGUgTGludXgga2VybmVsLgoKVGhlIFJJU0MtViBJT01N
VSBzcGVjaWZpY2F0aW9uLCB3aGljaCB0aGlzIHNlcmllcyBpcyBiYXNlZCBvbiwgaXMKcmF0aWZp
ZWQgYW5kIGF2YWlsYWJsZSBhdCBHaXRIdWIvcmlzY3Ytbm9uLWlzYSBbMV0uCgpBdCBhIGhpZ2gg
bGV2ZWwsIHRoZSBSSVNDLVYgSU9NTVUgc3BlY2lmaWNhdGlvbiBkZWZpbmVzOgoKMSkgRGF0YSBz
dHJ1Y3R1cmVzOgogIC0gRGV2aWNlLWNvbnRleHQ6IEFzc29jaWF0ZXMgZGV2aWNlcyB3aXRoIGFk
ZHJlc3Mgc3BhY2VzIGFuZCBob2xkcwogICAgcGVyLWRldmljZSBwYXJhbWV0ZXJzIGZvciBhZGRy
ZXNzIHRyYW5zbGF0aW9ucy4KICAtIFByb2Nlc3MtY29udGV4dHM6IEFzc29jaWF0ZXMgZGlmZmVy
ZW50IHZpcnR1YWwgYWRkcmVzcyBzcGFjZXMgYmFzZWQKICAgIG9uIGRldmljZS1wcm92aWRlZCBw
cm9jZXNzIGlkZW50aWZpY2F0aW9uIG51bWJlcnMuCiAgLSBNU0kgcGFnZSB0YWJsZSBjb25maWd1
cmF0aW9uIHVzZWQgdG8gZGlyZWN0IGFuIE1TSSB0byBhIGd1ZXN0CiAgICBpbnRlcnJ1cHQgZmls
ZSBpbiBhbiBJTVNJQy4KMikgSW4tbWVtb3J5IHF1ZXVlIGludGVyZmFjZToKICAtIENvbW1hbmQt
cXVldWUgZm9yIGlzc3VpbmcgY29tbWFuZHMgdG8gdGhlIElPTU1VLgogIC0gRmF1bHQvZXZlbnQg
cXVldWUgZm9yIHJlcG9ydGluZyBmYXVsdHMgYW5kIGV2ZW50cy4KICAtIFBhZ2UtcmVxdWVzdCBx
dWV1ZSBmb3IgcmVwb3J0aW5nICJQYWdlIFJlcXVlc3QiIG1lc3NhZ2VzIHJlY2VpdmVkCiAgICBm
cm9tIFBDSWUgZGV2aWNlcy4KICAtIE1lc3NhZ2Utc2lnbmFsZWQgYW5kIHdpcmUtc2lnbmFsZWQg
aW50ZXJydXB0IG1lY2hhbmlzbXMuCjMpIE1lbW9yeS1tYXBwZWQgcHJvZ3JhbW1pbmcgaW50ZXJm
YWNlOgogIC0gTWFuZGF0b3J5IGFuZCBvcHRpb25hbCByZWdpc3RlciBsYXlvdXQgYW5kIGRlc2Ny
aXB0aW9uLgogIC0gU29mdHdhcmUgZ3VpZGVsaW5lcyBmb3IgZGV2aWNlIGluaXRpYWxpemF0aW9u
IGFuZCBjYXBhYmlsaXRpZXMgZGlzY292ZXJ5LgoKClRoaXMgc2VyaWVzIGludHJvZHVjZXMgUklT
Qy1WIElPTU1VIGhhcmR3YXJlIGluaXRpYWxpemF0aW9uIGFuZCBjb21wbGV0ZQpzaW5nbGUtc3Rh
Z2UgdHJhbnNsYXRpb24gd2l0aCBwYWdpbmcgZG9tYWluIHN1cHBvcnQuCgpUaGUgcGF0Y2hlcyBh
cmUgb3JnYW5pemVkIGFzIGZvbGxvd3M6CgpQYXRjaCAxOiBJbnRyb2R1Y2VzIG1pbmltYWwgcmVx
dWlyZWQgZGV2aWNlIHRyZWUgYmluZGluZ3MgZm9yIHRoZSBkcml2ZXIuClBhdGNoIDI6IERlZmlu
ZXMgUklTQy1WIElPTU1VIGRhdGEgc3RydWN0dXJlcywgaGFyZHdhcmUgcHJvZ3JhbW1pbmcgaW50
ZXJmYWNlCiAgICAgICAgIHJlZ2lzdGVycyBsYXlvdXQsIGFuZCBtaW5pbWFsIGluaXRpYWxpemF0
aW9uIGNvZGUgZm9yIGVuYWJsaW5nIGdsb2JhbAogICAgICAgICBwYXNzLXRocm91Z2ggZm9yIGFs
bCBjb25uZWN0ZWQgbWFzdGVycy4KUGF0Y2ggMzogSW1wbGVtZW50cyB0aGUgZGV2aWNlIGRyaXZl
ciBmb3IgUENJZSBpbXBsZW1lbnRhdGlvbiBvZiBSSVNDLVYgSU9NTVUKICAgICAgICAgYXJjaGl0
ZWN0ZWQgaGFyZHdhcmUuClBhdGNoIDQ6IEludHJvZHVjZXMgSU9NTVUgaW50ZXJmYWNlcyB0byB0
aGUga2VybmVsIHN1YnN5c3RlbS4KUGF0Y2ggNTogSW1wbGVtZW50cyBkZXZpY2UgZGlyZWN0b3J5
IG1hbmFnZW1lbnQgd2l0aCBkaXNjb3Zlcnkgc2VxdWVuY2VzIGZvcgogICAgICAgICBJL08gbWFw
cGVkIG9yIGluLW1lbW9yeSBkZXZpY2UgZGlyZWN0b3J5IHRhYmxlIGxvY2F0aW9uLCBoYXJkd2Fy
ZQogICAgICAgICBjYXBhYmlsaXRpZXMgZGlzY292ZXJ5LCBhbmQgZGV2aWNlIHRvIGRvbWFpbiBh
dHRhY2ggaW1wbGVtZW50YXRpb24uClBhdGNoIDY6IEltcGxlbWVudHMgY29tbWFuZCBhbmQgZmF1
bHQgcXVldWUsIGFuZCBpbnRyb2R1Y2VzIGRpcmVjdG9yeSBjYWNoZQogICAgICAgICBpbnZhbGlk
YXRpb24gc2VxdWVuY2VzLgpQYXRjaCA3OiBJbXBsZW1lbnRzIHBhZ2luZyBkb21haW4sIHVzaW5n
IGhpZ2hlc3QgcGFnZS10YWJsZSBtb2RlIGFkdmVydGlzZWQKICAgICAgICAgYnkgdGhlIGhhcmR3
YXJlLiBUaGlzIHNlcmllcyBlbmFibGVzIG9ubHkgNEsgbWFwcGluZ3M7IGNvbXBsZXRlIHN1cHBv
cnQKICAgICAgICAgZm9yIGxhcmdlIHBhZ2UgbWFwcGluZ3Mgd2lsbCBiZSBpbnRyb2R1Y2VkIGlu
IGZvbGxvdy11cCBwYXRjaCBzZXJpZXMuCgpGb2xsb3ctdXAgcGF0Y2ggc2VyaWVzIHByb3ZpZGlu
ZyBNU0kgaW50ZXJydXB0IHJlbWFwcGluZywgY29tcGxldGUgQVRTL1BSSS9TVkEKYW5kIFZGSU8v
SU9NTVVGRCBzdXBwb3J0IGFyZSBhdmFpbGFibGUgYXQgdGhlIEdpdEh1YiBbMl0sIGFuZCBoYXMg
YmVlbiB0ZXN0ZWQKd2l0aCBwdWJsaXNoZWQgUUVNVSBSSVNDLVYgSU9NTVUgZGV2aWNlIG1vZGVs
IFszXS4KCkNoYW5nZXMgZnJvbSB2OToKLSByZWJhc2Ugb24gdjYuMTItcmMzCi0gIzYgTWVtb3J5
IG9yZGVyaW5nIGZpeCBhbmQgdXBkYXRlZCBjb21tZW50YXJ5LCBiYXNlZCBvbiBXaWxs4oCZcyBz
dWdnZXN0aW9ucy4KLSAjNyBSZW1vdmUgcmlzY3ZfaW9tbXVfZGV2aWNlX2RvbWFpbl90eXBlKCkg
YW5kIHVzZSBoZWFkLWxlc3Mga2ZyZWVfcmN1IGluCiAgICAgcmlzY3ZfaW9tbXVfcmVsZWFzZV9k
ZXZpY2UoKSwgYmFzZWQgb24gSmFzb24ncyBzdWdnZXN0aW9ucy4KCkJlc3QgcmVnYXJkcywKIFRv
bWFzeiBKZXpuYWNoCgpbMV0gbGluazogaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2LW5vbi1pc2Ev
cmlzY3YtaW9tbXUKWzJdIGxpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS90amV6bmFjaC9saW51eC9y
aXNjdl9pb21tdS5uZXh0ClszXSBsaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9xZW11LWRl
dmVsLzIwMjQxMDA0MTU1NzIxLjIxNTQ2MjYtMS1kYmFyYm96YUB2ZW50YW5hbWljcm8uY29tLwp2
OSBsaW5rOiAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtaW9tbXUvY292ZXIuMTcyODU3
OTk1OC5naXQudGplem5hY2hAcml2b3NpbmMuY29tLwp2OCBsaW5rOiAgaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGludXgtaW9tbXUvY292ZXIuMTcxODM4ODkwOC5naXQudGplem5hY2hAcml2b3Np
bmMuY29tLwp2NyBsaW5rOiAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtaW9tbXUvY292
ZXIuMTcxNzYxMjI5OC5naXQudGplem5hY2hAcml2b3NpbmMuY29tLwp2NiBsaW5rOiAgaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtaW9tbXUvY292ZXIuMTcxNjU3ODQ1MC5naXQudGplem5h
Y2hAcml2b3NpbmMuY29tLwp2NSBsaW5rOiAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
aW9tbXUvY292ZXIuMTcxNTcwODY3OS5naXQudGplem5hY2hAcml2b3NpbmMuY29tLwp2NCBsaW5r
OiAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtaW9tbXUvY292ZXIuMTcxNDc1MjI5My5n
aXQudGplem5hY2hAcml2b3NpbmMuY29tLwp2MyBsaW5rOiAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGludXgtaW9tbXUvY292ZXIuMTcxNDQ5NDY1My5naXQudGplem5hY2hAcml2b3NpbmMuY29t
Lwp2MiBsaW5rOiAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtaW9tbXUvY292ZXIuMTcx
MzQ1NjU5Ny5naXQudGplem5hY2hAcml2b3NpbmMuY29tLwp2MSBsaW5rOiAgaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGludXgtaW9tbXUvY292ZXIuMTY4OTc5MjgyNS5naXQudGplem5hY2hAcml2
b3NpbmMuY29tLwoKVG9tYXN6IEplem5hY2ggKDcpOgogIGR0LWJpbmRpbmdzOiBpb21tdTogcmlz
Y3Y6IEFkZCBiaW5kaW5ncyBmb3IgUklTQy1WIElPTU1VCiAgaW9tbXUvcmlzY3Y6IEFkZCBSSVND
LVYgSU9NTVUgcGxhdGZvcm0gZGV2aWNlIGRyaXZlcgogIGlvbW11L3Jpc2N2OiBBZGQgUklTQy1W
IElPTU1VIFBDSWUgZGV2aWNlIGRyaXZlcgogIGlvbW11L3Jpc2N2OiBFbmFibGUgSU9NTVUgcmVn
aXN0cmF0aW9uIGFuZCBkZXZpY2UgcHJvYmUuCiAgaW9tbXUvcmlzY3Y6IERldmljZSBkaXJlY3Rv
cnkgbWFuYWdlbWVudC4KICBpb21tdS9yaXNjdjogQ29tbWFuZCBhbmQgZmF1bHQgcXVldWUgc3Vw
cG9ydAogIGlvbW11L3Jpc2N2OiBQYWdpbmcgZG9tYWluIHN1cHBvcnQKCiAuLi4vYmluZGluZ3Mv
aW9tbXUvcmlzY3YsaW9tbXUueWFtbCAgICAgICAgICAgfCAgMTQ3ICsrCiBNQUlOVEFJTkVSUyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICA5ICsKIGRyaXZlcnMvaW9tbXUv
S2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDEgKwogZHJpdmVycy9pb21tdS9N
YWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgMiArLQogZHJpdmVycy9pb21tdS9y
aXNjdi9LY29uZmlnICAgICAgICAgICAgICAgICAgIHwgICAyMCArCiBkcml2ZXJzL2lvbW11L3Jp
c2N2L01ha2VmaWxlICAgICAgICAgICAgICAgICAgfCAgICAzICsKIGRyaXZlcnMvaW9tbXUvcmlz
Y3YvaW9tbXUtYml0cy5oICAgICAgICAgICAgICB8ICA3ODQgKysrKysrKysKIGRyaXZlcnMvaW9t
bXUvcmlzY3YvaW9tbXUtcGNpLmMgICAgICAgICAgICAgICB8ICAxMjAgKysKIGRyaXZlcnMvaW9t
bXUvcmlzY3YvaW9tbXUtcGxhdGZvcm0uYyAgICAgICAgICB8ICAgOTIgKwogZHJpdmVycy9pb21t
dS9yaXNjdi9pb21tdS5jICAgICAgICAgICAgICAgICAgIHwgMTY2MSArKysrKysrKysrKysrKysr
KwogZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS5oICAgICAgICAgICAgICAgICAgIHwgICA4OCAr
CiAxMSBmaWxlcyBjaGFuZ2VkLCAyOTI2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW9tbXUv
cmlzY3YsaW9tbXUueWFtbAogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvaW9tbXUvcmlzY3Yv
S2NvbmZpZwogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvaW9tbXUvcmlzY3YvTWFrZWZpbGUK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LWJpdHMuaAogY3Jl
YXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUtcGNpLmMKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LXBsYXRmb3JtLmMKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LmMKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LmgKCgpiYXNlLWNvbW1pdDogOGU5MjljYjU0NmVl
NDJjOWE2MWQyNGZhZTYwNjA1ZTllMzE5MjM1NAotLSAKMi4zNC4xCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
