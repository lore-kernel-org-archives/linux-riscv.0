Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA18606A31C
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Nov 2026 07:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JXxIhYnW;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=L0lFXczp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GRF5p5Qv34vhJlER6tY4YK8ZfgZI+rBVR1E86pauDxM=; b=JXxIhYnWCRF3rZD9ngnutKxjq9
	333Y+OasYKZZVRBjQfDRATZhqWOg9jXaORk7NiQ/tfxiY6PON0kCZusn/6fRPB9pDvSWylE6fhdKh
	wTsxeqq9vTcwtcc1lhagxXxUCj+GGf9+a593yFpOm3X7sjWciPQ0BGgaRl4FEcLhAPYiZ26xTvjzo
	0NGZjE707Z5iQYRiWjTcjUQOpdJZYk1OmPWgFk/oQDj2vfuhVOfblWHac0nOU4/1eNPUEdpmkZY4Q
	xhIGRw3nEntEH8/jMKCVrSYHhQNyr3YtmlYRtP3eyCyVfEpa1uV3UusY1QRfIZ6q8b5rd5Ar6W+2x
	uaA1/22Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPxKD-0000000Fnrf-2K3b;
	Sun, 08 Nov 2026 07:28:25 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPxKA-0000000Fnpt-3sLU
	for linux-riscv@lists.infradead.org;
	Sun, 08 Nov 2026 07:28:24 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-8439fe796ebso128601a34.3
        for <linux-riscv@lists.infradead.org>; Sat, 07 Nov 2026 23:28:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794122899; cv=none;
        d=google.com; s=arc-20260327;
        b=XDBqthU2D45b74rS30ufDaAFtQYcefU6lF9mO9JlybngSBSx+aiSmTcgLekatYBIvn
         hH4Mna3mqNbhP+ERJR3FWXTmWYdDwxCpaQDh+CutiX817Mvw9HqIug61zOQbZ8aqEQaU
         FYEVCyoBL6vqX9tWumTzfxcJ4zkGSzQYS5k9fKSnP4UFsW3LK34BY07gk/O902NBmgth
         gZazw3F3c76V9pRXcOS/IeVlMPs/YF3C1FHnYcQm02kmt95RsworV4Gqq8MF7x/9SCBz
         Z1yWT5CLrcfVAPULKGsXqvVBhTrBE4XMJdzKxRm0oQsl+aiLm1Dwe+0cZEt6HmwHI4MO
         CUVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3GPdPWtz5u4EzHahKBPeD/s+natUps7WDXeM/yF/8SA=;
        fh=ho4oIxaunsAUsikVFpS/pCIcuVxpgNmys/eHWeb54B8=;
        b=mjoR8tFOFgoq/DosDjL215yBP3mIlbNU9/Mzi8HAJMgcMHC3I6LZRKPnbGhaywkYMs
         KyMQjSJY3x9qTG7GcgI5Hgjmb4Suq1LbObCQGtvYWe2oXYjAy5UtRYs2DWIpFA02JobJ
         mw4uYfdrAxbOPCQSw2PztmmYyAP6RbN+FZv12kAJJK1cvfKrT6ZPj6XBb13qHr444pF5
         o0p8m3kqJ8tyNMKiefiGeiJzwmRxQ6kdCf86Q/D+plyZL4v8W0e/bYFXck4pRvfCocyg
         mOF8fdkTQM51GJs0Lm7fQOvNWQQgmdi7O8NsqTnojWneDzhcfooKR3NksaEHXX9AkfCc
         Makg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794122899; x=1794727699; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3GPdPWtz5u4EzHahKBPeD/s+natUps7WDXeM/yF/8SA=;
        b=L0lFXczp8dAxsIsx1AbT/Q6uX/FxXBEdhbtuLzRVah7yM8RxQh/7V/wScHBpjtEFzm
         7o3fd4cgv+ZgE0EAgIdHN/kNq961uTjDhMRPh5r3xNAs7CzxSut1Z4i+Pjbcu2pplsab
         6qWz9x6/wRbtevolDDDII+B9fd60byWjoOhMlHXYHSDes0Ei2Fx5rV82WQuYoUnIJade
         1MXagWZxz4WYN3hLBxG9hi5F4IEH8bvptobWk95Jv/s2znKDm0oevZRczTCgcLZU08xy
         K8TdLiFIjz5FZS9GUigucP486PLvderu/vSuWVvZhFj7iczeWv+1XATORvyY86SbKZAZ
         9MPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794122899; x=1794727699;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3GPdPWtz5u4EzHahKBPeD/s+natUps7WDXeM/yF/8SA=;
        b=lu5kRbXP6sVrBNUv1AvMydOCVW1R3Hk/PiTBWgE6TQ/eyElmyDcIA0BlTSUfQOfJye
         TX5N4oXU3DAn9Y32Bm5JMHWkl2QnnyHR/sR92AIbfcTf+ZQplvQXos1UW3tPTGNB8D5i
         imOmz8hJYPAGfqYchNgn9J81wq2MhrWcQvCvpdVymZ4f43DLTtlU0iqf9WvaQAYBaDTf
         vWweg/F52Fkf4r4W+dDOhgC7Osbo744qv3uU4A7PJAGvSOg/0nMqsxsjBh6MHfrsPqIg
         9tKBDdarwq5N2wgTFpOwsROdZgpYUUzuIsCUZYUtbMLdyuJedjzvNiL0Cv19x1yJ4xTt
         4+hg==
X-Forwarded-Encrypted: i=1; AKwUvBzY31iU1N/3ju+tF0W+7fc2ItEzJQUWz51kerhRmjDI0JvV+7zCmZYrDs0poZOUHSiULfWRTtGLZtzF/g==@lists.infradead.org
X-Gm-Message-State: APuU4Z/ymHB/WhN0amACjATSSqUSFym4sYKqlZTfuIT8zDAeigIc6y0b
	vEhMZvQUyrL6TPTrEeFwqzMBNL3g4ple5VpW/uXs+J1OA3DqTfH8k2GW6tNb1RKmMB9Q30uZj2Y
	Qv2WqH5PjNo99tfq6J5m3VCNHJ/CPz4gL9WZaDaAbrQ==
X-Gm-Gg: AYBFou3wD3i5nu0gs8bEre3VmWRQDq0YNE4Il77/Qrd+LeESvBWVqNFNZzfmPnsCzba
	3eNaSeDtu3ba5op0D7GvQTPgqxKzDos5hzjVMB2AnbYheoe7fxMRuVCAFXVAZte3CeMilMEAuzL
	CBGCQDcw0A3ygj/FcEvXDwvUg6QgNIymkB1VIp91RQr6CoeHM8tWib0STW8d9MAoYpL0InQCZj2
	8SELatG90LrYfUoEsigzQ0RasQDEswR528HTNAtFchUVxlncjzOI6TiQ3OCJl1XXrZYHM/K3pjP
	4mRrMASHOMbUonBKaqMhqJ/7lhTt6ALsrFgxMn3JxuV6BqNp1PCp6aRGOqf6UnnczcOcL991TT4
	p8UBDWWj30SGjMCIG07tLqRwDg0ZcXVvwjd03c1tEp+k=
X-Received: by 2002:a05:6830:4492:b0:816:a9dc:6d05 with SMTP id
 46e09a7af769-85f50450ebemr666748a34.4.1794122899111; Sat, 07 Nov 2026
 23:28:19 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260703122832.15984-1-cuiyunhui@bytedance.com>
 <20260703122832.15984-3-cuiyunhui@bytedance.com> <20260826010748.zphu3wh2hlm4t4o2@offworld>
In-Reply-To: <20260826010748.zphu3wh2hlm4t4o2@offworld>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Sun, 8 Nov 2026 15:28:07 +0800
X-Gm-Features: AclHuK_SNtR7Na4NEO8eC4WpcHN1PCPzaC_4JypevS8z-dbzdNtdoctuDfoYllw
Message-ID: <CAEEQ3wn2+coQyDz1+cvGRDsFZu8u0d--HTyxqSz2sxq1obZFHA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v8 2/3] riscv: introduce percpu.h into include/asm
To: Davidlohr Bueso <dave@stgolabs.net>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	dennis@kernel.org, tj@kernel.org, cl@gentwo.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	eddyz87@gmail.com, memxor@gmail.com, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, bjorn@kernel.org, pulehui@huawei.com, puranjay@kernel.org, 
	thuth@redhat.com, ajones@ventanamicro.com, ben.dooks@codethink.co.uk, 
	rkrcmar@ventanamicro.com, samuel.holland@sifive.com, zong.li@sifive.com, 
	conor.dooley@microchip.com, tglx@kernel.org, debug@rivosinc.com, 
	seanwascoding@gmail.com, andybnac@gmail.com, menglong8.dong@gmail.com, 
	cyrilbur@tenstorrent.com, wangruikang@iscas.ac.cn, atishp@rivosinc.com, 
	apatel@ventanamicro.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, bpf@vger.kernel.org, 
	arnd@arndb.de, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, 
	morbo@google.com, justinstitt@google.com, qingfang.deng@siflower.com.cn, 
	linux-arch@vger.kernel.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_232822_984365_094BF9B4 
X-CRM114-Status: GOOD (  22.35  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgRGF2aWRsb2hyLAoKT24gV2VkLCBBdWcgMjYsIDIwMjYgYXQgOTowOOKAr0FNIERhdmlkbG9o
ciBCdWVzbyA8ZGF2ZUBzdGdvbGFicy5uZXQ+IHdyb3RlOgo+Cj4gT24gRnJpLCAwMyBKdWwgMjAy
NiwgWXVuaHVpIEN1aSB3cm90ZToKPgo+ID5BZGQgUklTQy1WIHNwZWNpZmljIHRoaXNfY3B1IGhl
bHBlcnMgc28gY29tbW9uIHBlcmNwdSBvcGVyYXRpb25zIGNhbiB1c2UKPiA+c2hvcnQgYXJjaGl0
ZWN0dXJlIHNlcXVlbmNlcyBpbnN0ZWFkIG9mIHRoZSBnZW5lcmljIGltcGxlbWVudGF0aW9uLgo+
ID5OYXRpdmUtd2lkdGggb3BlcmF0aW9ucyB1c2UgQU1Pcywgd2hpbGUgOC8xNi1iaXQgb3BlcmF0
aW9ucyB1c2UgWmFiaGEgd2hlbgo+ID5hdmFpbGFibGUgYW5kIGEgbG9jYWwgMzItYml0IExSL1ND
IGZhbGxiYWNrIG90aGVyd2lzZS4KPgo+IFRoZSBzdWJqZWN0IGFuZCBjaGFuZ2Vsb2cgY291bGQg
dXNlIHNvbWUgaW1wcm92ZW1lbnQuIEhvdyBhYm91dDoKPgo+IHJpc2N2OiBpbXBsZW1lbnQgdGhp
c19jcHUgb3BlcmF0aW9ucwoKQWdyZWVkLgoKPgo+IHJpc2N2IGhhcyBubyBhc20vcGVyY3B1Lmgs
IHNvIGV2ZXJ5IHRoaXNfY3B1XyooKSByZWFkLW1vZGlmeS13cml0ZQo+IHRha2VzIHRoZSBnZW5l
cmljIGZhbGxiYWNrLCB3aGljaCBkaXNhYmxlcyBsb2NhbCBpcnFzLgo+Cj4gQSBzaW5nbGUgQU1P
IGlzIGF0b21pYyB3aXRoIHJlc3BlY3QgdG8gaW50ZXJydXB0cyBvbiB0aGUgbG9jYWwgaGFydCwK
PiBzbyB0aGlzIGNhbiBiZSByZXBsYWNlZCBieSBvbmUgcmVsYXhlZCBBTU8gdW5kZXIgcHJlZW1w
dGlvbiBkaXNhYmxlZC4KPiBOYXRpdmUtd2lkdGggb3BlcmF0aW9ucyB1c2UgQU1Pcywgd2hpbGUg
OC8xNi1iaXQgb3BlcmF0aW9ucyB1c2UgWmFiaGEgd2hlbgo+IGF2YWlsYWJsZSwgb3IgYSBsb2Nh
bCBMUi9TQyBzZXF1ZW5jZSBvdGhlcndpc2UuCj4KPiBTb21lIGNvbW1lbnRzIGJlbG93LCBidXQg
SSByYW4gdGhpcyBvbiBteSBzaWZpdmUgcDU1MCwgZmVlbCBmcmVlIHRvIGFkZCBteToKPgo+IFRl
c3RlZC1ieTogRGF2aWRsb2hyIEJ1ZXNvIDxkYXZlQHN0Z29sYWJzLm5ldD4KClRoYW5rcyBmb3Ig
dGVzdGluZy4gSSB3aWxsIGFkZCB5b3VyIFRlc3RlZC1ieS4KCj4KPiA+Cj4gPlNpZ25lZC1vZmYt
Ynk6IFl1bmh1aSBDdWkgPGN1aXl1bmh1aUBieXRlZGFuY2UuY29tPgo+ID4tLS0KPiA+IGFyY2gv
cmlzY3YvaW5jbHVkZS9hc20vcGVyY3B1LmggfCAyOTYgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysKPiA+IDEgZmlsZSBjaGFuZ2VkLCAyOTYgaW5zZXJ0aW9ucygrKQo+ID4gY3JlYXRl
IG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGVyY3B1LmgKPiA+Cj4gPmRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BlcmNwdS5oIGIvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9wZXJjcHUuaAo+ID5uZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID5pbmRleCAwMDAwMDAw
MDAwMDAwLi43NmIxYjhjMWZiOTUzCj4gPi0tLSAvZGV2L251bGwKPiA+KysrIGIvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9wZXJjcHUuaAo+ID5AQCAtMCwwICsxLDI5NiBAQAo+ID4rLyogU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIgKi8KPiA+Kwo+ID4rI2lmbmRlZiBf
X0FTTV9QRVJDUFVfSAo+ID4rI2RlZmluZSBfX0FTTV9QRVJDUFVfSAo+ID4rCj4gPisjaW5jbHVk
ZSA8bGludXgvYml0cy5oPgo+ID4rI2luY2x1ZGUgPGxpbnV4L3ByZWVtcHQuaD4KPiA+Kwo+ID4r
I2luY2x1ZGUgPGFzbS9hbHRlcm5hdGl2ZS1tYWNyb3MuaD4KPiA+KyNpbmNsdWRlIDxhc20vY21w
eGNoZy5oPgo+ID4rI2luY2x1ZGUgPGFzbS9jcHVmZWF0dXJlLW1hY3Jvcy5oPgo+ID4rI2luY2x1
ZGUgPGFzbS9od2NhcC5oPgo+ID4rCj4gPisjZGVmaW5lIFBFUkNQVV9SV19PUFMoc3opICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4rc3RhdGljIGlubGlu
ZSB1bnNpZ25lZCBsb25nIF9fcGVyY3B1X3JlYWRfIyNzeih2b2lkICpwdHIpICAgICAgICAgICAg
IFwKPiA+K3sgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBcCj4gPisgICAgICByZXR1cm4gUkVBRF9PTkNFKCoodSMjc3og
KilwdHIpOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4rfSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IFwKPiA+KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBcCj4gPitzdGF0aWMgaW5saW5lIHZvaWQgX19wZXJjcHVfd3Jp
dGVfIyNzeih2b2lkICpwdHIsIHVuc2lnbmVkIGxvbmcgdmFsKSAgXAo+ID4reyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IFwKPiA+KyAgICAgIFdSSVRFX09OQ0UoKih1IyNzeiAqKXB0ciwgKHUjI3N6KXZhbCk7ICAgICAg
ICAgICAgICAgICAgICAgICAgICBcCj4gPit9Cj4gPisKPiA+K1BFUkNQVV9SV19PUFMoOCkKPiA+
K1BFUkNQVV9SV19PUFMoMTYpCj4gPitQRVJDUFVfUldfT1BTKDMyKQo+ID4rCj4gPisjaWZkZWYg
Q09ORklHXzY0QklUCj4gPitQRVJDUFVfUldfT1BTKDY0KQo+ID4rI2VuZGlmCj4gPisKPiA+KyNk
ZWZpbmUgX19QRVJDUFVfQU1PX09QX0NBU0Uoc2Z4LCBuYW1lLCBzeiwgYW1vX2luc24pICAgICAg
ICAgICAgICAgICBcCj4gPitzdGF0aWMgaW5saW5lIHZvaWQgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4rX19wZXJjcHVfIyNuYW1lIyNfYW1v
X2Nhc2VfIyNzeih2b2lkICpwdHIsIHVuc2lnbmVkIGxvbmcgdmFsKSAgICAgICAgIFwKPiA+K3sg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcCj4gPisgICAgICBhc20gdm9sYXRpbGUgKCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4rICAgICAgICAgICAgICAiYW1vIiAj
YW1vX2luc24gI3NmeCAiIHplcm8sICVbdmFsXSwgJVtwdHJdIiAgICAgICAgICAgIFwKPgo+IFNv
IGFmYWljdCB0aGF0IHJkPXplcm8gY291bGQgc3RlZXIgdGhlIEFNTyBhd2F5IGZyb20gdGhlIGhh
cnQsIG5vPyBGcm9tIHRoZQo+IFphYW1vIGNoYXB0ZXIsIGl0IG5vdGVzIHRoYXQgY29tcGxleCBp
bXBsZW1lbnRhdGlvbnMgIm1pZ2h0IGFsc28gaW1wbGVtZW50Cj4gQU1PcyBhdCBtZW1vcnkgY29u
dHJvbGxlcnMsIGFuZCBjYW4gb3B0aW1pemUgYXdheSBmZXRjaGluZyB0aGUgb3JpZ2luYWwgdmFs
dWUKPiB3aGVuIHRoZSBkZXN0aW5hdGlvbiBpcyB4MCIuIFNpbWlsYXIgZm9yIHRoZSBvdGhlcnMg
KFBFUkNQVV84XzE2X09QKS4KPgo+IE1heWJlIHVzZSBhIHRtcCByZWdpc3RlciBpbnN0ZWFkIGFu
ZCBmb3JjZSB0aGUgb2xkIHZhbHVlIGZyb20gTDEgKCJuZWFyIik6CgpBZ3JlZWQuCgo+Cj4gICAg
ICAgICB1IyNzeiB0bXA7Cj4gICAgICAgICBhc20gdm9sYXRpbGUgKAo+ICAgICAgICAgICAgICAg
ICAiYW1vIiAjYW1vX2luc24gI3NmeCAiICVbdG1wXSwgJVt2YWxdLCAlW3B0cl0iCj4gICAgICAg
ICAgICAgICAgIDogW3B0cl0gIitBIiAoKih1IyNzeiAqKXB0ciksIFt0bXBdICI9ciIgKHRtcCkK
PiAgICAgICAgICAgICAgICAgOiBbdmFsXSAiciIgKCh1IyNzeikodmFsKSkpOwo+Cj4KPiAuLi4g
d2hpY2ggYXJtNjQgbm93IGRvZXMgZm9yIGl0cyBwY3B1IG9wczoKPgo+ICAgICAgICAgLyoKPiAg
ICAgICAgICAqIFVzZSB2YWx1ZS1yZXR1cm5pbmcgYXRvbWljcyBmb3IgQ1BVLWxvY2FsIG9wcyBh
cyB0aGV5IGFyZQo+ICAgICAgICAgICogbW9yZSBsaWtlbHkgdG8gZXhlY3V0ZSAibmVhciIgdG8g
dGhlIENQVSAoZS5nLiBpbiBMMSQpLgo+ICAgICAgICAgICoKPiAgICAgICAgICAqIGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL3IvZTdkNTM5ZWQtY2VkMC00Yjk2LThlY2QtMDQ4YTViODAzYjg1QHBh
dWxtY2stbGFwdG9wCj4gICAgICAgICAgKi8KPgo+ID4rICAgICAgICAgICAgICA6IFtwdHJdICIr
QSIgKCoodSMjc3ogKilwdHIpICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+KyAgICAg
ICAgICAgICAgOiBbdmFsXSAiciIgKCh1IyNzeikodmFsKSkgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCj4gPisgICAgICAgICAgICAgIDogIm1lbW9yeSIpOyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+Cj4gU2hvdWxkIG5vdCBuZWVkIHRoaXMgY2xv
YmJlciBlaXRoZXIgLSB0aGVzZSBkb24ndCBpbXBseSBiYXJyaWVycyAoYnV0IHlvdSBhbHNvIGdl
dAo+IHRoZW0gd2l0aCB0aGUgcHJlZW1wdGlvbiBkaXNhYmxlL2VuYWJsZSkuCj4KCkFncmVlZC4K
Cj4gPit9Cj4gPisKPgo+IC4uLgo+Cj4gPisjZGVmaW5lIHRoaXNfY3B1X2NtcHhjaGdfMShwY3As
IG8sIG4pIF9wY3BfcHJvdGVjdF9yZXR1cm4oY21weGNoZ19yZWxheGVkLCBwY3AsIG8sIG4pCj4K
PiBUaGlzIHRyaWdnZXJzIHRoYXQgY21weGNoZyB2YXJpYWJsZSBzaGFkb3dpbmcgaXNzdWUgeW91
IG1lbnRpb25lZCBpbiBwYXRjaCAxIHdpdGgKPiB0aGF0IF9fY3B1X2ZhbGxiYWNrX3RyeV9jbXB4
Y2hnIGFsc28gdXNpbmcgJ19fb2xkJy4KPgoKQWdyZWVkLiBJIHdpbGwgcHV0IGFyY2hfY21weGNo
Z19yZWxheGVkKCkgYmVoaW5kIGEgdHlwZWQgX19hbHdheXNfaW5saW5lIGhlbHBlci4KCj4gPisj
ZGVmaW5lIHRoaXNfY3B1X2NtcHhjaGdfMihwY3AsIG8sIG4pIF9wY3BfcHJvdGVjdF9yZXR1cm4o
Y21weGNoZ19yZWxheGVkLCBwY3AsIG8sIG4pCj4gPisjZGVmaW5lIHRoaXNfY3B1X2NtcHhjaGdf
NChwY3AsIG8sIG4pIF9wY3BfcHJvdGVjdF9yZXR1cm4oY21weGNoZ19yZWxheGVkLCBwY3AsIG8s
IG4pCj4gPisKPiA+KyNpZmRlZiBDT05GSUdfNjRCSVQKPiA+KyNkZWZpbmUgdGhpc19jcHVfY21w
eGNoZ184KHBjcCwgbywgbikgX3BjcF9wcm90ZWN0X3JldHVybihjbXB4Y2hnX3JlbGF4ZWQsIHBj
cCwgbywgbikKPiA+Kwo+ID4rI2RlZmluZSB0aGlzX2NwdV9jbXB4Y2hnNjQocGNwLCBvLCBuKSB0
aGlzX2NwdV9jbXB4Y2hnXzgocGNwLCBvLCBuKQo+ID4rI2VuZGlmCj4gPisKPiA+KyNpZmRlZiBz
eXN0ZW1faGFzX2NtcHhjaGcxMjgKPiA+KyNkZWZpbmUgdGhpc19jcHVfY21weGNoZzEyOChwY3As
IG8sIG4pICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+Kyh7ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCj4gPisgICAgICB1MTI4IHJldF9fOyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4rICAgICAgdHlwZW9mKHBjcCkgKnB0cl9f
OyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+KyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCj4gPisgICAgICBwcmVlbXB0X2Rpc2FibGVfbm90cmFjZSgpOyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4rICAgICAgcHRyX18gPSByYXdfY3B1X3B0
cigmKHBjcCkpOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+KyAgICAg
IGlmIChzeXN0ZW1faGFzX2NtcHhjaGcxMjgoKSkgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCj4gPisgICAgICAgICAgICAgIHJldF9fID0gY21weGNoZzEyOF9sb2NhbChwdHJf
XywgKG8pLCAobikpOyAgICAgICAgICAgICAgXAo+ID4rICAgICAgZWxzZSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+KyAgICAg
ICAgICAgICAgcmV0X18gPSB0aGlzX2NwdV9nZW5lcmljX2NtcHhjaGcocGNwLCAobyksIChuKSk7
ICAgICAgICBcCj4gPisgICAgICBwcmVlbXB0X2VuYWJsZV9ub3RyYWNlKCk7ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4rICAgICAgcmV0X187ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+K30pCj4K
PiBXaXRoIHRob3NlIGFib3ZlIHRoaXNfY3B1X2NtcHhjaGcoKSB5b3UgY291bGQgbm93IGVuYWJs
ZSBIQVZFX0NNUFhDSEdfTE9DQUwuCj4KClllcywgSSB3aWxsIHNlbGVjdCBpdCBpbiBhIHNlcGFy
YXRlIHBhdGNoLgoKPiBUaGFua3MsCj4gRGF2aWRsb2hyCgpUaGFua3MsCll1bmh1aQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
