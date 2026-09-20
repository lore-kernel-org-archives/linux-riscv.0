Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9710C982CC
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Sep 2026 05:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ggRm/aCoV6NC/iI2wDdZtQz97Y5UjikVB4DAO2R/BXA=; b=tpsoXvndeTSk4v
	BsxQ7WNN4FgOkss6kMQmeBc0/whnOODrkgDzRjIqCFwye2y01j4YLKLxjnadtJ1gp463Ak111i4xe
	albL4HFKDq7VsTL2ZYHwx02aSmC0wj0dtY3BCBAldnh0DxJ9wTAeZSLMCUOh+4saHNmQZoFZdYZps
	YrJLqjdftMwQQLjmBaYnIyfSVJL8e1S+iWMeftB6NWjtS/7yRl6LGC9lsSCFTpl9VAxNCuD3Ycl7l
	84FK+rDIuCqacQsP2YhuS4wz6cKFNCdTt49lzwmha2Q/9V5z06dJiOkyOVVEnreV08P2K7Qqb0lly
	G53PQzPIzSzvQ8rhIoRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89ko-0000000GvGR-0Df1;
	Sun, 20 Sep 2026 05:06:18 +0000
Received: from mail-pj2-x05.google.com ([2607:f8b0:4864:39::5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89kk-0000000GvFm-2vEa
	for linux-riscv@lists.infradead.org;
	Sun, 20 Sep 2026 05:06:16 +0000
Received: by mail-pj2-x05.google.com with SMTP id 98e67ed59e1d1-3965683e9e9so1495841a91.1
        for <linux-riscv@lists.infradead.org>; Sat, 19 Sep 2026 22:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880773; x=1790485573; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ataTrCoeuQQFtL3tpWSQNBrTWuZ8RuoviVcaS8zLYpE=;
        b=OQMW6mrse0FKsx4lzlBce5+QCH8AFnzpLgu8B73OvSZV50DwXBsagHxjzrVXZAVYmQ
         NuwLHWarHEkWTgfSCXtu0Cm7Kx7qJczcb2mO/Ewev5J+5CWeGUxUrwXaqQQazcPS7uaR
         s3uo1X6I6xeV2ol1bDtfXkuRbpa20qpi0YjcFS0FpRwNX64dEhGIgHUzJ8E841pZphDW
         TDySH+xQ3YLrlr9iAsypUFxiUM5CdRo7+TUiM+ghfcTzarNURJZR80yVnaZ4NSy+KVSr
         Q3OCLcFm0J/LDkBKYYRmktGw2/O81L3azaOOEVP9teKoJviuCMYJGFXqDkiflDHlaRuU
         V27A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880773; x=1790485573;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ataTrCoeuQQFtL3tpWSQNBrTWuZ8RuoviVcaS8zLYpE=;
        b=1Z65bCSIvYw6LJYP2lA/06b8ybZ22LQ58fB2h78TZrVmYRos1B48kWcwFyehmg7iAt
         7h1RUq9tekdJiEt9t9qPcudzySUgvdFSzxAfM264GtjDHX3dU6zeyJrYmpc+gttoAkYP
         RmEKfgAYOaIGfT7yYlZwyinf+7LFkmbJAZvX+lVdbfzH+xwr1BcItsJFHxUdtTkXt7oK
         hvT8mFTC3X7GPzBfGT4tIjznJ+cPam3m0qA6WzfIhTUJpFIn3jPlsPC907tje/P3T9v/
         u6VMfUSlyD9BZpXA7q1NZIHBhgr7SqKrEvnicFo8LSVxr7562slh5eMjClvtTTRUpHWW
         v8pg==
X-Forwarded-Encrypted: i=1; AKwUvBw8CYir8dGEjvDGAGvD1uYuuUWdYKOSbYgpIMU77KkuJD+vwZMnrH7DH9ZRDVSXex/cxlBtRG+nnd2khg==@lists.infradead.org
X-Gm-Message-State: AFuF++loZZ/J0DtC0WYZWCZYeY7jEaO4ShkIzSyLXsjwh0w+hrmy/sWx
	bSxYk+Ob2MBqRc897Ce922AvY1sPxA73IOcyFmPg1+0cjzD8r8I29nvq
X-Gm-Gg: AYBFou3RCDH8IRgJAt8e3rn2ja2iz5svWgLVgGxgdRIpJNbTDwYv5qoUOSXksBbS+TM
	qCceQpHQ6a2n5HRCHwK8U7LIQkAQzVdSqIkJGmnwIAa+lgJNpITjbvRZGwz/F66tDJ+dFyPKUeK
	6slNxa3r7y/QNVEMH8v4k4Iy1c8d7gg8eacLzZofGhwyt67Mlobp4NMAbuYKDm/nWwI5AfORK8n
	OWelWkDJvx/gcjS6pXNKYB2IAE87OouSY5iILWIqCP1Uo9+CfdAtAxAipqEHE83uoZlfaHOAgKm
	rJ8bImGzegH1FPOZ/2zFdweeL4D++Jrr9qnqlQCxhMdF8KgrRNTTJvStRucpvafFaCmkvnLGEVK
	IEhVLk7DcKPhraz4QVigDg0mRcKL7qrdYQcf7EfmlRz1LRKLrhg3ktY75C5yG27UDsizBI4zBi8
	2IpCiroWY2EzeokOB+xxsEYDCMCXV46Vi7F6uOG3L2MPabba6LQmdWe8xYhn7gw4fO4LO8ZRDy/
	5vnWGcUsS/h6E74
X-Received: by 2002:a17:90b:3eca:b0:39e:6a7f:1dc6 with SMTP id 98e67ed59e1d1-39e6a7f2209mr6292197a91.34.1789880772639;
        Sat, 19 Sep 2026 22:06:12 -0700 (PDT)
Received: from [192.168.50.174] ([124.64.19.40])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c3145dasm7433814a91.4.2026.09.19.22.06.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 22:06:12 -0700 (PDT)
Message-ID: <8572d404-8a33-4cd3-a14f-ebff7c2ac487@gmail.com>
Date: Sun, 20 Sep 2026 13:05:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 08/10] iommu/riscv: Pre-enable GADE for
 second-stage domains
To: fangyu.yu@linux.alibaba.com
Cc: alex@ghiti.fr, andrew.jones@oss.qualcomm.com, anup@brainfault.org,
 aou@eecs.berkeley.edu, atish.patra@linux.dev, baolu.lu@linux.intel.com,
 gong.shuai@sanechips.com.cn, guoren@kernel.org, iommu@lists.linux.dev,
 jgg@nvidia.com, jgg@ziepe.ca, joerg.roedel@amd.com, joro@8bytes.org,
 jroedel@suse.de, kevin.tian@intel.com, kvm-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, pjw@kernel.org, robin.murphy@arm.com,
 skhawaja@google.com, tomasz.jeznach@linux.dev, vasant.hegde@amd.com,
 will@kernel.org, zong.li@sifive.com
References: <90826872-1374-49e4-832d-555abf8e8369@gmail.com>
 <20260920031259.20950-1-fangyu.yu@linux.alibaba.com>
From: Gong Shuai <gsh517025@gmail.com>
In-Reply-To: <20260920031259.20950-1-fangyu.yu@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_220614_731609_5A51175F 
X-CRM114-Status: GOOD (  27.21  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgRmFuZ3l1LAoKT24gOS8yMC8yMDI2IDExOjEyIEFNLCBmYW5neXUueXVAbGludXguYWxpYmFi
YS5jb20gd3JvdGU6Cj4+SGkgRmFuZ3l1LAo+Pgo+Pk9uIDkvMTUvMjAyNiAxMToyOCBBTSwgZmFu
Z3l1Lnl1QGxpbnV4LmFsaWJhYmEuY29tIHdyb3RlOgo+Pj4gRnJvbTogRmFuZ3l1IFl1IDxmYW5n
eXUueXVAbGludXguYWxpYmFiYS5jb20+Cj4+Pgo+Pj4gUHJlLWVuYWJsZSBSSVNDVl9JT01NVV9E
Q19UQ19HQURFIGluIHRoZSBkZXZpY2UgY29udGV4dCB3aGVuCj4+PiBhdHRhY2hpbmcgYSBzZWNv
bmQtc3RhZ2UgZG9tYWluLCBpZiB0aGUgSU9NTVUgc3VwcG9ydHMgQU1PX0hXQUQuCj4+Pgo+Pj4g
U29mdHdhcmUgcHJlLXBvcHVsYXRlcyBzZWNvbmQtc3RhZ2UgcGFnZSB0YWJsZXMgd2l0aCBEIHNl
dCwgc28KPj4+IGVuYWJsaW5nIEdBREUgYnkgZGVmYXVsdCBkb2VzIG5vdCBjaGFuZ2Ugbm9ybWFs
IGJlaGF2aW9yLiBXaGVuCj4+PiBkaXJ0eSB0cmFja2luZyBpcyBlbmFibGVkLCBpb21tdWZkIGNs
ZWFycyB0aGUgcHJlLXNldCBEIGJpdHMgYW5kCj4+PiBHQURFIGJlY29tZXMgbmVjZXNzYXJ5IGZv
ciBoYXJkd2FyZSB0byB1cGRhdGUgdGhlIGRpcnR5IGJpdCBvbgo+Pj4gd3JpdGUgYWNjZXNzLgo+
Pj4KPj4+IFRoaXMgYXZvaWRzIHRvZ2dsaW5nIEdBREUgZHluYW1pY2FsbHkgYW5kIGtlZXBzIGRl
dmljZSBjb250ZXh0Cj4+PiBzZXR1cCBjb25zaXN0ZW50IHdpdGggc2Vjb25kLXN0YWdlIGRvbWFp
biBhdHRhY2htZW50Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEZhbmd5dSBZdSA8ZmFuZ3l1Lnl1
QGxpbnV4LmFsaWJhYmEuY29tPgo+Pj4gLS0tCj4+PiAgIGRyaXZlcnMvaW9tbXUvcmlzY3YvaW9t
bXUuYyB8IDIgKysKPj4+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+Pj4KPj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LmMgYi9kcml2ZXJzL2lvbW11
L3Jpc2N2L2lvbW11LmMKPj4+IGluZGV4IDE2Nzc5ODc3MzUxYi4uZjAxZmQ0ZTJmODQwIDEwMDY0
NAo+Pj4gLS0tIGEvZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS5jCj4+PiArKysgYi9kcml2ZXJz
L2lvbW11L3Jpc2N2L2lvbW11LmMKPj4+IEBAIC0xMzMwLDYgKzEzMzAsOCBAQCBzdGF0aWMgaW50
IHJpc2N2X2lvbW11X2F0dGFjaF9wYWdpbmdfZG9tYWluKHN0cnVjdCBpb21tdV9kb21haW4gKmlv
bW11X2RvbWFpbiwKPj4+ICAgCQkJRklFTERfUFJFUChSSVNDVl9JT01NVV9EQ19JT0hHQVRQX01P
REUsIHB0X2luZm8uaW9oZ2F0cF9tb2RlKSB8Cj4+PiAgIAkJCUZJRUxEX1BSRVAoUklTQ1ZfSU9N
TVVfRENfSU9IR0FUUF9HU0NJRCwgZG9tYWluLT5nc2NpZCkgfAo+Pj4gICAJCQlGSUVMRF9QUkVQ
KFJJU0NWX0lPTU1VX0RDX0lPSEdBVFBfUFBOLCBwdF9pbmZvLnBwbik7Cj4+PiArCQlpZiAoaW9t
bXUtPmNhcHMgJiBSSVNDVl9JT01NVV9DQVBBQklMSVRJRVNfQU1PX0hXQUQpCj4+PiArCQkJZGMu
dGMgfD0gUklTQ1ZfSU9NTVVfRENfVENfR0FERTsKPiAKPiBIaSBTaHVhaToKPiAKPj4KPj5JIG1p
Z2h0IGJlIG1pc3Npbmcgc29tZXRoaW5nLCBidXQgSSBkb24ndCBzZWUgaG93IHRoZSBHQURFIGJp
dCBzZXQKPj5oZXJlIHJlYWNoZXMgdGhlIGhhcmR3YXJlIElPTU1VIERDLiBJbiByaXNjdl9pb21t
dV9pb2Rpcl91cGRhdGUoKQo+PihpbiBwYXRjaCAwNC8xMCksIGl0IGxvb2tzIGxpa2Ugb25seSB0
aGUgViBiaXQgaXMgdGFrZW46Cj4+Cj4+CXRjID0gUkVBRF9PTkNFKGRjLT50Yyk7Cj4+CXRjIHw9
IG5ld19kYy0+dGEgJiBSSVNDVl9JT01NVV9EQ19UQ19WOwo+PgkuLi4KPj4JV1JJVEVfT05DRShk
Yy0+dGMsIHRjKTsKPj4KPiAKPiBZb3XigJlyZSByaWdodCDigJQgdGhpcyBpcyBhIHJlYWwgaXNz
dWUuCj4gCj4gR0FERSB3YXMgYmVpbmcgc2V0IGluIHRoZSBzb2Z0d2FyZS1zaWRlIGRjLCBidXQg
aXQgd2FzIG5vdAo+IHByb3BhZ2F0ZWQgaW50byB0aGUgaGFyZHdhcmUgREMgaW4gcmlzY3ZfaW9t
bXVfaW9kaXJfdXBkYXRlKCkuCj4gCj4gSSBoYXZlIGFscmVhZHkgZml4ZWQgdGhpcyBpbiBteSBs
b2NhbCB0cmVlLCBhbmQgSeKAmWxsIGluY2x1ZGUgdGhlCj4gY2hhbmdlIGluIHRoZSBuZXh0IHZl
cnNpb24gb2YgdGhlIHBhdGNoc2V0Ogo+ICAgICAgdGMgJj0gflJJU0NWX0lPTU1VX0RDX1RDX0dB
REU7Cj4gICAgICB0YyB8PSBuZXdfZGMtPnRjICYgUklTQ1ZfSU9NTVVfRENfVENfR0FERTsKPiAg
ICAgIHRjIHw9IG5ld19kYy0+dGEgJiBSSVNDVl9JT01NVV9EQ19UQ19WOwo+IAoKT25lIHRob3Vn
aHQgaGVyZSwgaW5zdGVhZCBvZiB1cGRhdGluZyBpbmRpdmlkdWFsIFRDIGJpdHMgb25lIGJ5IG9u
ZQppbiByaXNjdl9pb21tdV9pb2Rpcl91cGRhdGUoKSwgY291bGQgd2UgdHJhbnNmZXIgYWxsIHNv
ZnR3YXJlLWNvbmZpZ3VyYWJsZQpiaXRzIGZyb20gdGhlIGluY29taW5nIERDIHRvIHRoZSBoYXJk
d2FyZSBEQyBpbiBvbmUgZ28/CgpTb21ldGhpbmcgbGlrZToKCS4uLgoJdGMgPSAoUkVBRF9PTkNF
KGRjLT50YykgJiB+R0VOTUFTS19VTEwoMTEsIDApKSB8CgkJIChuZXdfZGMtPnRjICYgR0VOTUFT
S19VTEwoMTEsIDApKTsKCS4uLgoJV1JJVEVfT05DRShkYy0+dGMsIHRjKTsKCknigJltIG5vdCBz
dXJlIHdoZXRoZXIgdGhpcyBjb3VsZCBoYXZlIG5lZ2F0aXZlIHNpZGUgZWZmZWN0cy4KCj4+SSBz
YXcgdGhhdCB5b3UgbWVudGlvbmVkIHlvdSB0ZXN0ZWQgaXQgb24gUUVNVS4gQXMgZmFyIGFzIEkg
a25vdywKPj5tYWlubGluZSBRRU1VIGhhcyBub3QgeWV0IGRlY2xhcmVkIHRoZSBBTU9fSFdBRCBj
YXBhYmlsaXR5LiBDb3VsZAo+PnlvdSBjbGFyaWZ5IHdoZXRoZXIgeW91IHVzZWQgYSBtb2RpZmll
ZCBRRU1VIGZvciB0aGlzIHRlc3Q/Cj4+Cj4gCj4gSSB1c2VkIG1haW5saW5lIFFFTVUsIG5vdCBh
IG1vZGlmaWVkIG9uZS4KPiAKPiBJbiBRRU1VLCBJIG9ubHkgdGVzdGVkIHRoZSBzZWNvbmQtc3Rh
Z2UgcGF0aCB3aXRoIGEKPiBWTSB1c2luZyBkZXZpY2UgcGFzc3Rocm91Z2guCj4gCj4gSSBkaWQg
bm90IHRlc3QgdGhlIGRpcnR5LWxvZyByZWxhdGVkIHBhcnQgdGhlcmUsCj4gc28gdGhhdCBwYXRo
IGNhbm5vdCBiZSBjb3ZlcmVkIHRoZXJlLgo+IAo+IFRoYXQgaXMgd2h5IEkgbm90ZWQgaW4gdGhl
IFRPRE8gdGhhdCBJIHdpbGwgYnVpbGQgYQo+IGRlZGljYXRlZCB0ZXN0IGNhc2UgZm9yIGRpcnR5
IGxvZyBoYW5kbGluZyBsYXRlci4KClNvcnJ5LCBJIG1pc3NlZCB0aGF0IFRPRE8uCgoKVGhhbmtz
LApTaHVhaQoKPiAKPiBUaGFua3MsCj4gRmFuZ3l1Cj4gCj4+VGhhbmtzLAo+PlNodWFpCj4+Cj4+
PiAgIAl9IGVsc2Ugewo+Pj4gICAJCWlmICghcmlzY3ZfaW9tbXVfZnNjX3N1cHBvcnRlZChpb21t
dSwgcHRfaW5mby5mc2NfaW9zYXRwX21vZGUpKQo+Pj4gICAJCQlyZXR1cm4gLUVOT0RFVjsKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
