Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EFB6D5CCB6
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Dec 2025 10:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+vZ3afzFvDj6XHGFmc3SWsblC6LiQYbb8hWjSrsyWoY=; b=3THK8ow4HAoglY
	HpNrPUtJ7hkedtJnBtwNbQzg4O8dCkVDyozGGjGZhne6ptMzsqF9K8BwagReqhhWnlfouzqrm+X5f
	zvB8y2xQUugZi09jPKF6dO//kh1DI4RMSUuNjZkucO9Vv4S6Nuz6zN038HbyApctmKW3MDyD3tHA0
	W3sR33onDqQmUGgYOp2A8XfhdLetoU9tlrl65RHvAyxVIX02yVhA/SOC6yuSqBaauxnZLuyjWHVx3
	MiQFlQNYMRe2a/qfYcRT351mS6h9Isah43LeqYmKajvSUyDzMPrAeG9txXpYRCIUBIk2jL5w/bB/v
	mdwW2upIZS/G6V6fJ3Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVRxG-000000050zk-4BTj;
	Tue, 16 Dec 2025 10:06:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVRxE-000000050zL-17jV
	for linux-riscv@lists.infradead.org;
	Tue, 16 Dec 2025 10:06:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2C7A74018A;
	Tue, 16 Dec 2025 10:06:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DAA5C4CEF1;
	Tue, 16 Dec 2025 10:06:47 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Cyan Yang <cyan.yang@sifive.com>,
	Nutty Liu <liujingqi@lanxincomputing.com>,
	Nick Hu <nick.hu@sifive.com>,
	Thierry Reding <treding@nvidia.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] irqchip/riscv-aplic: Pass context data to syscore callbacks
Date: Tue, 16 Dec 2025 11:06:41 +0100
Message-ID: <d52051073ff90ea3fd023c9d15822e30f456c9d1.1765879470.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_020652_351573_F4101412 
X-CRM114-Status: GOOD (  13.67  )
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

T24gUklTQy1WOgoKICAgIGRyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtYXBsaWMtbWFpbi5jOjEx
MToyMDogZXJyb3I6IGluaXRpYWxpemF0aW9uIG9mIOKAmGludCAoKikodm9pZCAqKeKAmSBmcm9t
IGluY29tcGF0aWJsZSBwb2ludGVyIHR5cGUg4oCYaW50ICgqKSh2b2lkKeKAmSBbLVdlcnJvcj1p
bmNvbXBhdGlibGUtcG9pbnRlci10eXBlc10KICAgICAgMTExIHwgICAgICAgICAuc3VzcGVuZCA9
IGFwbGljX3N5c2NvcmVfc3VzcGVuZCwKCSAgfCAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+
fn5+fn5+fn5+fn5+CiAgICBkcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWFwbGljLW1haW4uYzox
MTE6MjA6IG5vdGU6IChuZWFyIGluaXRpYWxpemF0aW9uIGZvciDigJhhcGxpY19zeXNjb3JlX29w
cy5zdXNwZW5k4oCZKQogICAgZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1hcGxpYy1tYWluLmM6
MTEyOjE5OiBlcnJvcjogaW5pdGlhbGl6YXRpb24gb2Yg4oCYdm9pZCAoKikodm9pZCAqKeKAmSBm
cm9tIGluY29tcGF0aWJsZSBwb2ludGVyIHR5cGUg4oCYdm9pZCAoKikodm9pZCnigJkgWy1XZXJy
b3I9aW5jb21wYXRpYmxlLXBvaW50ZXItdHlwZXNdCiAgICAgIDExMiB8ICAgICAgICAgLnJlc3Vt
ZSA9IGFwbGljX3N5c2NvcmVfcmVzdW1lLAoJICB8ICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+
fn5+fn5+fn5+fn5+CiAgICBkcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWFwbGljLW1haW4uYzox
MTI6MTk6IG5vdGU6IChuZWFyIGluaXRpYWxpemF0aW9uIGZvciDigJhhcGxpY19zeXNjb3JlX29w
cy5yZXN1bWXigJkpCiAgICBkcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWFwbGljLW1haW4uYzog
SW4gZnVuY3Rpb24g4oCYYXBsaWNfcHJvYmXigJk6CiAgICBkcml2ZXJzL2lycWNoaXAvaXJxLXJp
c2N2LWFwbGljLW1haW4uYzozNzU6MTc6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBm
dW5jdGlvbiDigJhyZWdpc3Rlcl9zeXNjb3JlX29wc+KAmTsgZGlkIHlvdSBtZWFuIOKAmHJlZ2lz
dGVyX3N5c2NvcmXigJk/IFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQog
ICAgICAzNzUgfCAgICAgICAgICAgICAgICAgcmVnaXN0ZXJfc3lzY29yZV9vcHMoJmFwbGljX3N5
c2NvcmVfb3BzKTsKCSAgfCAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn4KCSAg
fCAgICAgICAgICAgICAgICAgcmVnaXN0ZXJfc3lzY29yZQoKRml4IHRoaXMgYnkgdXBkYXRpbmcg
dGhlIGRyaXZlciBmb3IgdGhlIHN5c2NvcmUgQVBJIGNoYW5nZXMgaW4gY29tbWl0CmE5N2ZiYzNl
ZTNlMmE1MzYgKCJzeXNjb3JlOiBQYXNzIGNvbnRleHQgZGF0YSB0byBjYWxsYmFja3MiKS4KCkZp
eGVzOiAxYzU0NmJiNDMzNjE4ODQzICgiaXJxY2hpcC9yaXNjdi1hcGxpYzogUHJlc2VydmUgQVBM
SUMgc3RhdGVzIGFjcm9zcyBzdXNwZW5kL3Jlc3VtZSIpClNpZ25lZC1vZmYtYnk6IEdlZXJ0IFV5
dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+Ci0tLQpDb21taXQgYTk3ZmJjM2Vl
M2UyYTUzNiBpcyBpbiB2Ni4xOS1yYzEsIHdoaWNoIGlzIG5vdyB0aGUgYmFzZSBmb3IKaXJxY2hp
cC9pcnEvZHJpdmVycy4KLS0tCiBkcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWFwbGljLW1haW4u
YyB8IDEwICsrKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1hcGxpYy1t
YWluLmMgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWFwbGljLW1haW4uYwppbmRleCBiNzYw
OTQyZTU3ZjkxNmQ4Li40NDk1Y2EyNmFiZjU3MTJkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2lycWNo
aXAvaXJxLXJpc2N2LWFwbGljLW1haW4uYworKysgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2
LWFwbGljLW1haW4uYwpAQCAtODksNyArODksNyBAQCBzdGF0aWMgdm9pZCBhcGxpY19zYXZlX3N0
YXRlcyhzdHJ1Y3QgYXBsaWNfcHJpdiAqcHJpdikKIAl9CiB9CiAKLXN0YXRpYyBpbnQgYXBsaWNf
c3lzY29yZV9zdXNwZW5kKHZvaWQpCitzdGF0aWMgaW50IGFwbGljX3N5c2NvcmVfc3VzcGVuZCh2
b2lkICpkYXRhKQogewogCXN0cnVjdCBhcGxpY19wcml2ICpwcml2OwogCkBAIC05OSw3ICs5OSw3
IEBAIHN0YXRpYyBpbnQgYXBsaWNfc3lzY29yZV9zdXNwZW5kKHZvaWQpCiAJcmV0dXJuIDA7CiB9
CiAKLXN0YXRpYyB2b2lkIGFwbGljX3N5c2NvcmVfcmVzdW1lKHZvaWQpCitzdGF0aWMgdm9pZCBh
cGxpY19zeXNjb3JlX3Jlc3VtZSh2b2lkICpkYXRhKQogewogCXN0cnVjdCBhcGxpY19wcml2ICpw
cml2OwogCkBAIC0xMTIsNiArMTEyLDEwIEBAIHN0YXRpYyBzdHJ1Y3Qgc3lzY29yZV9vcHMgYXBs
aWNfc3lzY29yZV9vcHMgPSB7CiAJLnJlc3VtZSA9IGFwbGljX3N5c2NvcmVfcmVzdW1lLAogfTsK
IAorc3RhdGljIHN0cnVjdCBzeXNjb3JlIGFwbGljX3N5c2NvcmUgPSB7CisJLm9wcyA9ICZhcGxp
Y19zeXNjb3JlX29wcywKK307CisKIHN0YXRpYyBpbnQgYXBsaWNfcG1fbm90aWZpZXIoc3RydWN0
IG5vdGlmaWVyX2Jsb2NrICpuYiwgdW5zaWduZWQgbG9uZyBhY3Rpb24sIHZvaWQgKmRhdGEpCiB7
CiAJc3RydWN0IGFwbGljX3ByaXYgKnByaXYgPSBjb250YWluZXJfb2YobmIsIHN0cnVjdCBhcGxp
Y19wcml2LCBnZW5wZF9uYik7CkBAIC0zNzIsNyArMzc2LDcgQEAgc3RhdGljIGludCBhcGxpY19w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCQlkZXZfZXJyX3Byb2JlKGRldiwg
cmMsICJmYWlsZWQgdG8gc2V0dXAgQVBMSUMgaW4gJXMgbW9kZVxuIiwKIAkJCSAgICAgIG1zaV9t
b2RlID8gIk1TSSIgOiAiZGlyZWN0Iik7CiAJZWxzZQotCQlyZWdpc3Rlcl9zeXNjb3JlX29wcygm
YXBsaWNfc3lzY29yZV9vcHMpOworCQlyZWdpc3Rlcl9zeXNjb3JlKCZhcGxpY19zeXNjb3JlKTsK
IAogI2lmZGVmIENPTkZJR19BQ1BJCiAJaWYgKCFhY3BpX2Rpc2FibGVkKQotLSAKMi40My4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
