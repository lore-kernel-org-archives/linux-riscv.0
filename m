Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED9EC98317
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 10:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t8phQKNwdGbVUfKroKOAIKysYNA5CUMe/Ootks/8Pfk=; b=ectr9MThHidIAl
	uNlzHnf1n6GCQOhi1A6bf3fl9hRHM+HVVtHTTuX5hD7Nzgy+WazZUwcPRdznf8DaFk8aWS36P3VUK
	TtcaTrrbhryj8HKhM51EToUCdfTq0C7mofqOXmmxQ4s5rUpbAkFm8iluxM4sMU2Fc7u3hKV36Qiqq
	31tES8EwvDk0LKvK94A+detNoEQB20snq7PrwpUWAJMwSAuUu6XkazDrUXWP2iozjLPaeSUN56Dxg
	vjjvHMRpcpn6EbroySrnOMyPUS9hpGtCZHQwbEcMDgoaonPl8CXblBu6lAPBIZiJ+TAW+HvQHZMIN
	p2mCvDqt8lgbyPYTnXlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9gGS-0000000AeUx-2lA8;
	Thu, 24 Sep 2026 10:01:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9gGR-0000000AeUj-3zc5
	for linux-riscv@bombadil.infradead.org;
	Thu, 24 Sep 2026 10:01:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=T7LuCKXGDjbZFiX4G8+riT24rAGxjFj+z2Uy0TMvuv8=; b=EWsZ2KKZWsHijnNtOswH8SPq8d
	TOz0r4JYzUr8Jl0tWBLQqKYLC0LuzCXp9qIppmyHAM0IXfSgNkTX9qNW0p38YO246AJBT3MjJCGe5
	QRIr0fg4lgPz8lUgzD8bOWNdchS3Orb5nVsmc288wgTZxDSMtXuuo4oFvk+o5U6baM4NHfZsMBd4q
	pEFj/Kj8S2ZaXcJinkK90Jl1+M69tGHHln9hoSSGf+BvlhQtloEZAXk+TGPmhvre5lr5snCKgHTt3
	vtkoCFgViLRtv2MWFAGZcJGsYarRLR2DZVRJtpR5QtqhlM/5Yl29v6CbEHe19mf9vmel9DM9Lc7gp
	qm/yZ7EA==;
Received: from mail-dl2-x0f.google.com ([2607:f8b0:4864:38::f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9gGO-0000000FoYV-3bYw
	for linux-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 10:01:14 +0000
Received: by mail-dl2-x0f.google.com with SMTP id a92af1059eb24-1450541ab18so499999c88.0
        for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 03:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1790244070; x=1790848870; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T7LuCKXGDjbZFiX4G8+riT24rAGxjFj+z2Uy0TMvuv8=;
        b=CdUoCQSYWq4vW9SqbWOTSIKHGZiOSnMm2JhpAoiR4P7AcUE+Z+YFGQVMvUVdDLMoBv
         aA7nUnP1Qdt6Bwx/GKh6QyvDT0tl/NmwiB2B0t+IKqyM4xxpRcCihFb2GYZdYBfiQwTp
         10ceIsuxQuoQcsya5yTDNCfgK2jcJCN7rsNpotwTvJu6Kjxa83NcvrPuDxPP7PSlgKes
         jKQDnIfES9uV8aXjsczuKjDSMbeeBCxMANTdYUqqXpW/NeE91qnLG1yXc4+D7hkZjKhC
         Hwh3Sl7yeFmDSZkLdpMena+ZcwZINOUwXo+qk/+r47xPTTPc/8ci38POC4dyvsgx99L8
         pRmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790244070; x=1790848870;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T7LuCKXGDjbZFiX4G8+riT24rAGxjFj+z2Uy0TMvuv8=;
        b=t0gPMUq1jYGeUPmfvkkGbHeg1YnEYJ0+FvJ7gn5W8HNBurK8MqSdF7AXWtPKgweKRE
         CBhyGkXButkvs2gJ/iPCHSsY8uansz9p03zq+fn0bTVcE740OBr4ipsJ5uAeQT5mjtzx
         xuRYj+dGn31c6rStntx2bnoKX3lV++KeVj+yozyDDErwp0WF8ScMyzdjgKGl3zXTOZCf
         OWbHgTDeArIDGClCDREmmNUvfyCk2K5Hap1HkBdQTNzYeJEl66os+cYmZhq6dcUdXVMy
         M+DolPuO0Yrbm6UnBcTthEbjCnUe5OvdiuqoTfr+q2dM74+pCoU86pwNi/7XPMV2qyYz
         pBbg==
X-Forwarded-Encrypted: i=1; AKwUvBwYwY2QX9rHSSRTdpJ494wxzF6hOKdvXsNf3mmTpKI+P1m9tfT39KWq5A2vhMc9FvEOAV9jR/5z99rlHA==@lists.infradead.org
X-Gm-Message-State: AFuF++mYQr6rzVbAJqjzxoCSnQqmAbMYjvowOC7ZsnDanQ5bS1qC8bja
	dGOqxRTa2GxU0zDEl/d3+BH9U2tv5CLVORkxz8GtxVLyE4tQ0WnStesUbWdKqd9FW9s=
X-Gm-Gg: AYBFou2tSUIdKRTX4UiZkjkIlwe/sJKvBunUg1XvbVl5p1wAT3b22G+F3svygYS3wji
	aMezP/VfiyWSyd95GHd8dRa2kbPo/8orhVO/KfnfL8uOGaC5uH/9HDrEr0xCUWbVT5GVnSRG7JQ
	lHgCwCBXZMLU1cxQuOdtx/xOW1hbfaAsN0A5cOvR4lkxeXCy2K0HhLOHq05PG/07yPUJWRoclw/
	Mgcotk+sri/H2vTf/iMNxinILdL4ZCr4WEhH2T85P8j0qR0aL4nvAJmRZN2QZ9nV5JO5gkmY3NP
	P7xmIuDCpT+5VeLhkR4qRUM90KENU20cj72J3F/iDNINprA091I0pJX2e9W5D66xYu8NekwA7D8
	EUOGBZFl8fn3OOY3gahqMntwWGDKvRdgomPtQJX66hwg+NFTA9SLe25t8sLqX+SuzsC/lX6tbPy
	NEcM6bIlnlpb+5U9+3VPe02NYugVWSCx3no5l4WeRwc5EJDV2wuEtRGq4LccymMa1fj44yg70Zu
	wcTu8UsHU8=
X-Received: by 2002:a05:693c:829b:10b0:33f:3ad7:fe5b with SMTP id 5a478bee46e88-34004592b23mr1653984eec.3.1790244069709;
        Thu, 24 Sep 2026 03:01:09 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96e498f0sm11649975eec.27.2026.09.24.03.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:01:09 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: tomasz.jeznach@linux.dev,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	mark.rutland@arm.com,
	andrew.jones@oss.qualcomm.com,
	guoren@kernel.org,
	david.laight.linux@gmail.com,
	zhangzhanpeng.jasper@bytedance.com,
	yang.yicong@picoheart.com,
	nutty.liu@hotmail.com,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v14 0/2] RISC-V IOMMU HPM support
Date: Thu, 24 Sep 2026 03:01:03 -0700
Message-ID: <20260924100106.2054127-1-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_110113_229768_C325A2C7 
X-CRM114-Status: GOOD (  20.42  )
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

VGhpcyBzZXJpZXMgaW1wbGVtZW50cyBzdXBwb3J0IGZvciB0aGUgUklTQy1WIElPTU1VIGhhcmR3
YXJlIHBlcmZvcm1hbmNlCm1vbml0b3IuCgpUaGUgUklTQy1WIElPTU1VIFBNVSBkcml2ZXIgaXMg
aW1wbGVtZW50ZWQgYXMgYW4gYXV4aWxpYXJ5IGRldmljZSBkcml2ZXIKY3JlYXRlZCBieSB0aGUg
cGFyZW50IFJJU0MtViBJT01NVSBkcml2ZXIuIFRoZXJlZm9yZSwgdGhlIGNoaWxkIGRyaXZlcgpj
YW4gb2J0YWluIHJlc291cmNlcyBhbmQgaW5mb3JtYXRpb24gZnJvbSB0aGUgcGFyZW50IGRldmlj
ZSwgc3VjaCBhcwp0aGUgTU1JTyBiYXNlIGFkZHJlc3MgYW5kIElSUSBudW1iZXIuCgpTYXNoaWtv
LWJvdCByZXBvcnRlZCB0aGF0IHdyaXRpbmcgUklTQ1ZfSU9NTVVfSVBTUl9QTUlQIHdpbGwgdHJp
Z2dlciBhCmJ1cyBhY2Nlc3MgZmF1bHQgb24gc3RyaWN0IGhhcmR3YXJlIGltcGxlbWVudGF0aW9u
cyBpbiB2MTMgc2VyaWVzLgpCdXQgdGhpcyBmb2xsb3dzIHRoZSBleGFjdCBzYW1lIHBhdHRlcm4g
YWxyZWFkeSB1c2VkIGVsc2V3aGVyZSBpbgpkcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LmMgZm9y
IHRoZSBvdGhlciB0aHJlZSBpbnRlcnJ1cHQgY2F1c2VzIChDUSwgRlEsClBRKSwgYWxsIG9mIHdo
aWNoIHdyaXRlIHRoZWlyIG93biBiaXQgdG8gdGhpcyBzYW1lIElQU1IgcmVnaXN0ZXIgdG8gY2xl
YXIKdGhlIHBlbmRpbmcgZmxhZy4KCkluIGVhY2ggb2YgdGhlc2UgZXhpc3RpbmcgY2FsbCBzaXRl
cywgdGhlIElQU1Igd3JpdGUgaXMgcGVyZm9ybWVkIGFzIGFuCmV4cGxpY2l0LCBzZXBhcmF0ZSBz
dGVwIGZyb20gY2xlYXJpbmcgdGhlIHVuZGVybHlpbmcgcGVyLXF1ZXVlIENTUgplcnJvci9zdGF0
dXMgYml0cyAoQ1FDU1IvRlFDU1IvUFFDU1IpLiBJZiBJUFNSIHdlcmUgcHVyZWx5IGEgcmVhZC1v
bmx5LApjb21iaW5hdG9yaWFsIG1pcnJvciBvZiB0aG9zZSBDU1IgYml0cywgdGhlc2Ugd3JpdGVz
IHdvdWxkIGJlCnVubmVjZXNzYXJ5IOKAlCBjbGVhcmluZyB0aGUgQ1NSIHdvdWxkIGJlIHN1ZmZp
Y2llbnQgb24gaXRzIG93bi4gVGhlIGZhY3QKdGhhdCB0aGUgZHJpdmVyIGhhcyBhbHdheXMgd3Jp
dHRlbiBJUFNSIGluZGVwZW5kZW50bHkgYXQgZXZlcnkgb25lIG9mCnRoZXNlIHNpdGVzIGluZGlj
YXRlcyBlYWNoIElQU1IgYml0IGhhcyBpdHMgb3duIHdyaXRlLTEtdG8tY2xlYXIgbGF0Y2gsCm5v
dCBhIGxpdmUgY29tYmluYXRvcmlhbCBvdXRwdXQuCkdpdmVuIHRoYXQsIHRoZSBQTUlQIHdyaXRl
IGluIHRoZSBQTVUgaGFuZGxlciBpcyBjb25zaXN0ZW50IHdpdGggYW4KZXN0YWJsaXNoZWQsIGFs
cmVhZHktaW4tdHJlZSBjb252ZW50aW9uIGZvciB0aGlzIHNhbWUgcmVnaXN0ZXIgcmF0aGVyCnRo
YW4gYSBuZXcgcGF0dGVybiBpbnRyb2R1Y2VkIGJ5IHRoaXMgc2VyaWVzLgoKQ2hhbmdlZCBpbiB2
MTM6Ci0gUmVvcmRlciB0aGUgcmVnaXN0cmF0aW9uIG9mIGNwdWhwIGFjdGlvbgoKQ2hhbmdlZCBp
biB2MTI6Ci0gUmViYXNlZCBvbnRvIHY3LjMtcmM0Ci0gQWRkIHJhd19zcGluX3RyeWxvY2tfaXJx
c2F2ZSBmb3IgLT5yZWFkKCkgZmxvdwoKQ2hhbmdlZCBpbiB2MTE6Ci0gUmViYXNlZCBvbnRvIHY3
LjMtcmMzCi0gQWRkIHJpc2N2X2lvbW11X2hwbV9kaXNhYWJsZSB0byBkZXN0cm95IGF1eCBkZXYg
YmVmb3JlIE1TSSBpcyBmcmVlZAotIEZpeCBDUFUgaG90cGx1ZyByYWNlIHJpc2tzIHJlcG9ydGVk
IGJ5IHNhc2hpa28tYm90IGFzIGZvbGxvd3MKLSBSZS12YWxpZGF0ZSBwcmVfY291bnQgYWZ0ZXIg
cmVhZGluZyBodyBjb3VudGVyCi0gTW92ZSBod2Mtc3RhdGUgaW50byBhdG9taWMgY3JpdGljYWwg
c2VjdGlvbiAocG11LT5sb2NrKQoKQ2hhbmdlZCBpbiB2MTA6Ci0gT3B0aW1pemUgaGktbG8taGkg
YnkgZG8gd2hpbGUgZm9yIGh5cGVydmlzb3IgY2FzZQotIEFkZCByYXcgc3BpbmxvY2sgZm9yIGNw
dSBob3RwbHVnIHJhY2UgYW5kIElSUUNISVBfTU9WRV9ERUZFUlJFRAotIFJlbW92ZSBpcnEgd29y
ayBtZWNoYW5pc20gZm9yIElSUUNISVBfTU9WRV9ERUZFUlJFRAoKQ2hhbmdlZCBpbiB2OToKLSBD
bGVhciBQTUlQIGluIGlycSBoYW5kbGVyIG9uIHdyb25nIENQVSBmb3IgcmUtdHJpZ2dlcmluZyBJ
UlEKLSBBZGQgYSBsb2NrIGluIG9mZmxpbmVfY3B1IHRvIGF2b2lkIGNwdSBob3RwbHVnIHJhY2Ug
Y29uZGl0aW9uCgpDaGFuZ2VkIGluIHY4OgotIFJlYmFzZWQgb250byB2Ny4zLXJjMgotIEFkZCBp
cnEgd29yayBtZWNoYW5pc20gZm9yIElSUUNISVBfTU9WRV9ERUZFUlJFRCBjYXNlCi0gRmlsdGVy
IG11bHRpcGxlIGN5Y2xlIGV2ZW50IGNhc2UKCkNoYW5nZWQgaW4gdjc6Ci0gUmViYXNlZCBvbnRv
IHRoZSB2Ny4zLXJjMQotIFJlbW92ZSByYXcgc3BpbmxvY2sKLSBDaGVjayBDUFUgbWF0Y2hpbmcg
YXQgdGhlIGJlZ2lubmluZyBvZiBpcnEgaGFuZGxlcgotIEFkZCBQRVJGX0hFU19TVE9QUEVEIGNo
ZWNrIGJlZm9yZSBvdmVyZmxvdyBoYW5kbGluZwoKQ2hhbmdlZCBpbiB2NjoKLSBSZWJhc2VkIG9u
dG8gdGhlIGxhdGVzdCB2Ny4zLXJjCi0gVXNlIHN5c2ZzX2VtaXQgaW5zdGVhZCBvZiBjcHVtYXBf
cHJpbnRfdG9fcGFnZWJ1ZgotIFNldCB1cCBvbl9jcHUgYW5kIGlycSBhZmZpbml0eSBieSBjcHVo
cCBjYWxsYmFja3MKLSBDaGFuZ2UgdHlwZSBvZiBvbl9jcHUgZnJvbSB1bnNpZ25lZCBpbnQgdG8g
aW50Ci0gUmVqZWN0IGZpbHRlciBvcGVyYW5kcyBvZiBjeWNsZSBldmVudCBpbiBldmVudF9pbml0
Ci0gQ2hlY2sgcmV0dXJuIHZhbHVlIG9mIGNvdW50ZXIgbnVtYmVyIGFuZCAgbWFza3MgaW4gcHJv
YmUKLSBBZGQgcmF3IHNwaW5sb2NrIGZvciByYWNlIGNvbmRpdGlvbiAodGhpcmQgY29tbWl0KQoK
Q2hhbmdlZCBpbiB2NToKLSBQaWNrIHVwIHN1Z2dlc3Rpb25zIGZyb20gc2FzaGlrby1ib3QgYXMg
Zm9sbG93cwotIEZpeCBldmVudCBncm91cCB2YWxpZGF0aW9uIGZvciBzdyBldmVudAotIEJpbmQg
SVJRIHRvIGF1eCBQTVUgZGV2IGluc3RlYWQgb2YgcGFyZW50IElPTU1VIGRldgotIENsZWFyIE9G
IGJpdCB3aGVuIGV2ZW50IGlzIE5VTEwKLSBJbXByb3ZlIGhpLWxvLWhpIHBhdHRlbgotIEFkZCBi
YWNrIElSUUZfU0hBUkVEIGZsYWcgZHVlIHRvIG1pc21hdGNoCi0gTWFuYWdlIGNwdWhwIGFuZCBw
bXUgcmVnaXN0ZXIgYnkgZGV2cmUKCkNoYW5nZWQgaW4gdjQ6Ci0gUmViYXNlZCBvbnRvIHY3LjMt
cmMKLSBVc2UgaXNfc2FtcGxpbmdfZXZlbnQoKSBpbnN0ZWFkIG9mIGFjY2Vzc2luZyB2YWlyYWJs
ZSBkaXJlY3RseQotIFJlbmFtZSB0aGUgbWF0Y2hpbmcgbmFtZSBmcm9tICJpb21tdS5wbXUiIHRv
ICJyaXNjdi1pb21tdS5wbXUiCi0gQ2hhbmdlIHRoZSBuYW1pbmcgb2YgUE1VIGRldmljZSBmb3Ig
YXZvaWQgIjoiIGluIFBDSWUgY2FzZQotIEFkZCBzdXBwcmVzc19iaW5kX2F0dHJzIGF0dHJpYnV0
ZQotIFJlbW92ZSBJUlFGX1NIQVJFRCBmbGFnCi0gU2V0IGlycSBhZmZpbml0eSB0byBsb2NhbCBD
UFUgb2YgSU9NTVUKLSBBbGxvY2F0ZSBJRCBieSBJREEgZm9yIGF1eGlsaWFyeSBkZXZpY2UKLSBQ
aWNrIHVwIHN1Z2dlc3Rpb25zIGZyb20gc2FzaGlrby1ib3QKCkNoYW5nZWQgaW4gdjM6Ci0gUmVi
YXNlZCBvbnRvIHY3LjItcmMzCi0gVXNlIGhpX2xvX3dyaXRlcS9yZWFkcSB0byBhY2Nlc3MgcmVn
aXN0ZXIKLSBQaWNrIGNvbW1lbnRzIGZyb20gc2FzaGlrby1ib3QgYXMgZm9sbG93cwotIFNldCBJ
UlEgQ1BVIGFmZmluaXR5Ci0gUmVtb3ZlIElSUUZfT05FU0hPVCBmbGFnIHdoZW4gcmVxdWVzdCBp
cnEKLSBBZGp1c3QgY3ljbGUgZXZlbnQgY2hlY2sgYnkgY2hlY2tpbmcgZXZlbnRfaWQgZmllbGQg
b25seQotIEZpeCBidWcgZm9yIGdyb3VwIGV2ZW50cyB2ZXJpZmljYWl0b24KLSBGaXggS0FTQU4g
aXNzdWUgYWJvdXQgY2FzdGluZyAzMi1iaXQgdmFyaWFibGUgdG8gdW5zaWduZWQgbG9uZyBwb2lu
dGVyCi0gQ2xlYXIgSVBTUiBwZW5kaW5nIGJpdCBiZWZvcmUgc3RhcnRpbmcgY291bnRlcgotIENs
ZWFyIE9GIGJpdCBpbiBldmVudCBzZWxlY3RvciByZWdpc3RlciBpbiBpcnEgaGFuZGxlcgotIFJl
bGVhc2UgaXJxIGJ5IGRldm0gaW5zdGVhZCBvZiBleHBsaWNpdCBmcmVlX2lycQoKQ2hhbmdlZCBp
biB2MjoKLSBSZWJhc2VkIG9udG8gdjcuMi1yYzEKLSBVc2UgaGktbG8taGkgbWVjaGFuaXNtIHRv
IHJlYWQgY291bnRlci4KICBTdWdnZXN0ZWQgYnkgR3VvIFJlbiBhbmQgRGF2aWQgTGFpZ2h0CgpD
aGFuZ2VkIGluIHYxOgotIFJlYmFzZWQgb250byB2Ni4xOS1yYzgKLSBQaWNrIGFsbCBzdWdnZXN0
aW9ucyBhbmQgZmVlZGJhY2tzIGZyb20gdjEgc2VyaWVzCi0gQWRkIGNwdSBob3RwbHVnIGltcGxl
bWVudGF0aW9uIHRvIGF2b2lkIHJhY2UgZW5hYmxlbWVudAotIE1vdmUgUE1VLXJlbGF0ZWQgZGVm
aW5pdGlvbiBmcm9tIGhlYWRlciB0byBjIGZpbGUKLSBDaGFuZ2UgUE1VIGRyaXZlciB0byBhdXhp
bGlhcnkgZGV2aWNlIGRyaXZlcgoKQ2hhbmdlZCBpbiBSRkM6Ci0gUmViYXNlIG9udG8gdjYuMTMt
cmM3Ci0gQ2xlYXIgaW50ZXJydXB0IHBlbmRpbmcgYmVmb3JlIGhhbmRsaW5nIGludGVycnVwdAot
IEZpeCB0aGUgY291bnRlciB2YWx1ZSBpc3N1ZSBjYXVzZWQgYnkgT0YgYml0IGluIHRoZSBjeWNs
ZSBjb3VudGVyLgotIEludm9rZSByaXNjdl9pb21tdV9ocG1fZGlzYWJsZSgpIGluc3RlYWQgb2Yg
cmlzY3ZfaW9tbXVfcG11X3VuaW5pdCgpCiAgaW4gcmlzY3ZfaW9tbXVfcmVtb3ZlKCkKClpvbmcg
TGkgKDIpOgogIGRyaXZlcnMvcGVyZjogcmlzY3YtaW9tbXU6IGFkZCByaXNjLXYgaW9tbXUgcG11
IGRyaXZlcgogIGlvbW11L3Jpc2N2OiBjcmVhdGUgYSBhdXhpbGlhcnkgZGV2aWNlIGZvciBIUE0K
CiBkcml2ZXJzL2lvbW11L3Jpc2N2L0tjb25maWcgICAgICB8ICAgIDEgKwogZHJpdmVycy9pb21t
dS9yaXNjdi9pb21tdS1iaXRzLmggfCAgIDYxIC0tCiBkcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11
LmMgICAgICB8ICAgNDggKysKIGRyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUuaCAgICAgIHwgICAg
NCArCiBkcml2ZXJzL3BlcmYvS2NvbmZpZyAgICAgICAgICAgICB8ICAgMTIgKwogZHJpdmVycy9w
ZXJmL01ha2VmaWxlICAgICAgICAgICAgfCAgICAxICsKIGRyaXZlcnMvcGVyZi9yaXNjdl9pb21t
dV9wbXUuYyAgIHwgMTAxMiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDcgZmlsZXMg
Y2hhbmdlZCwgMTA3OCBpbnNlcnRpb25zKCspLCA2MSBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBkcml2ZXJzL3BlcmYvcmlzY3ZfaW9tbXVfcG11LmMKCi0tIAoyLjQzLjcKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
