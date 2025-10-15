Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9AC8CCD18E
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 06:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gQNBpS9KBP0kgpHAoIQilNZOmSF0l1Tf0jwrh7K/8QE=; b=aSd3S+8zvw+BDF
	LPThAUoYIE6SoXWEWB4253PH84stqHRKKiPK4l8MVWu+bbU1OszBsfyQf/bh1Tf/c6VvlrvcO8G+L
	3oajU5Piuzx1qSeBX8254Qu7d+xFj61v/V9y0SEm0k99go7WUC6l4feefmqS0avTB7Ego7pOsS19k
	u5Ddt1ZXzO+hCCjuNEj7TLxQv5G9Z20cr5VehGvURIFM18JENWByoBi2UoOEO0rveUuufTjMGTiGp
	8zvX7mr41fwq524LVHZeJchDAcYKO6mWt7M2r2h5kHBMGWA/qWC3qStfd+/TaeX/9GbDT6NRp0q6m
	R2D63tSF1YhA2eF+dMhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8uqp-00000000ZMN-2RGw;
	Wed, 15 Oct 2025 06:19:07 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8uqj-00000000ZBk-09MG
	for linux-riscv@lists.infradead.org;
	Wed, 15 Oct 2025 06:19:06 +0000
X-QQ-mid: esmtpgz13t1760509078t710fc538
X-QQ-Originating-IP: fKuI2SoLTPBzi9ZxhQ0J1CaSp3/phsZPssuIEn3Y994=
Received: from GPU-Server-A6000.. ( [202.201.1.132])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 15 Oct 2025 14:17:56 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13976680870695852025
EX-QQ-RecipientCnt: 14
From: Yuan Tan <tanyuan@tinylab.org>
To: arnd@arndb.de,
	masahiroy@kernel.org,
	nathan@kernel.org,
	palmer@dabbelt.com,
	linux-kbuild@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	i@maskray.me,
	tanyuan@tinylab.org,
	falcon@tinylab.org,
	ronbogo@outlook.com,
	z1652074432@gmail.com,
	lx24@stu.ynu.edu.cn
Subject: [PATCH v2 2/8] scripts/syscalltbl.sh: add optional --used-syscalls argument for syscall trimming
Date: Wed, 15 Oct 2025 14:17:49 +0800
Message-ID: <B120EFEBD27B9B67+6751ec7c12d04aafe1de79502b984ed65013f6cf.1760463245.git.tanyuan@tinylab.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760463245.git.tanyuan@tinylab.org>
References: <cover.1760463245.git.tanyuan@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-QQ-XMAILINFO: Mp62enUr7azuivZrNzLe2z/QyVUzXCJedV2fP4VOoeilXfYsV4ZqRp1Q
	SD9ja5G7fhijZ4fBz6IPzGcx+/2/RN+fUXyu6RRM3+kwfSq8xVoQYEmKb42i/o6CEGmbl+z
	To0hGppWjxasmj0aOuYlQ94hFjwPtjp/8+PqLDWmQDk1ianxIuuosCgFrrcNXx5Hu5D0/se
	q8P4oKE6Cbsm+CHm3Vlh7flu4gHdyJAEUgTADZ5E23In/V6nNQHwIFUJl+zoj4QsDiTH9Pq
	Ixb64JmhoIjuZPxy4gaJ9BSTFZiHs9PxhbU3ynRhVWY0Yj0OL6mD4wyFOKMuGC9mtMTCLIb
	s50UTOrSJNlgGDBQUHQJ1gAOrmsaOnjip2hsaKz/mDsutm4GeKh4YD7AiDp55AIESY57cQ2
	OuM4SpL4gSLOHc+oxAzjn90bAjtBr+oAxkoavQ5/3XayUEN90Pjy4/T5ddFvT6aue81sMD+
	QcvEPJpCg2wbXdBP8nlnTQGMnCwGd1vKI3L86g3mUWdS4akteT3r9JvDodYFBbjOouRzue4
	jKcezTcwMnPEdvSEijmd6RbOu+r45pRe0LG58braY8sZX1p7TT+0bF/j/taEtIb9cBGQh/T
	1G1+HYBe0baM5A8Qrh9a2xJl/Ic9lE7cHlljMvdaA/Env701QztSxNQkmqQPBI8MR+EmlZI
	ZhTNpAEy2dq0sJzIZtbwNgYA7YXWE4fQdZtwbabZSKooos3qtt5xfaAPUObGoBazl0FKKxf
	QmmI4rPm/EOVDHTovWaXe+UPRxx43hsnrSknJMBA+w/3hFzeCbesQAqFhNydgeClc8dO+jt
	Mhv9lzHVDRa+Ovgvt8SY4AtgaA/XMvsRH0ZcYBFItl/1haX084VrS2zdc1GVncOHrzr3hTt
	NSzGZ9c8CQr2mwYa62pHLSyhXFYgQGy1TicC3b9zkOMDRkmWxO3HURU1GEyAyhEJ/9Kp+hZ
	FK3N6PEPP9bucFHDg775Nt2wlLa0ylEP2T84CXKHAkGpk2vrT0iDswE8zzm5laiYOpF0=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_231901_574228_91A33B7F 
X-CRM114-Status: GOOD (  10.86  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Yuhang Zheng <z1652074432@gmail.com>

Add support for an optional `--used-syscalls` argument to
scripts/syscalltbl.sh. When provided, the argument takes a comma-separated
list of syscall names that should remain enabled in the generated syscall
table. Any syscall not present in the list will be replaced with a
`__SYSCALL(nr, sys_ni_syscall)` entry.

This enables selective system call table generation when
CONFIG_TRIM_UNUSED_SYSCALLS is set.

Signed-off-by: Yuhang Zheng <z1652074432@gmail.com>
Signed-off-by: Yuan Tan <tanyuan@tinylab.org>
Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 scripts/syscalltbl.sh | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/scripts/syscalltbl.sh b/scripts/syscalltbl.sh
index 6a903b87a7c2..27d8dfce5748 100755
--- a/scripts/syscalltbl.sh
+++ b/scripts/syscalltbl.sh
@@ -22,12 +22,14 @@ usage() {
 	echo >&2 "  OUTFILE   output header file"
 	echo >&2
 	echo >&2 "options:"
-	echo >&2 "  --abis ABIS        ABI(s) to handle (By default, all lines are handled)"
+	echo >&2 "  --abis ABIS                ABI(s) to handle (By default, all lines are handled)"
+	echo >&2 "  --used-syscalls SYSCALLS   Keep only the specified syscall; trim others"
 	exit 1
 }
 
 # default unless specified by options
 abis=
+used_syscalls=
 
 while [ $# -gt 0 ]
 do
@@ -35,6 +37,14 @@ do
 	--abis)
 		abis=$(echo "($2)" | tr ',' '|')
 		shift 2;;
+    --used-syscalls=*)
+        used_syscalls_raw=${1#--used-syscalls=}
+        if [ -z "$used_syscalls_raw" ]; then
+            used_syscalls='^$'
+        else
+            used_syscalls=$(echo "$used_syscalls_raw" | tr ',' '|')
+        fi
+        shift;;
 	-*)
 		echo "$1: unknown option" >&2
 		usage;;
@@ -52,6 +62,7 @@ outfile="$2"
 
 nxt=0
 
+
 grep -E "^[0-9]+[[:space:]]+$abis" "$infile" | {
 
 	while read nr abi name native compat noreturn; do
@@ -66,6 +77,12 @@ grep -E "^[0-9]+[[:space:]]+$abis" "$infile" | {
 			nxt=$((nxt + 1))
 		done
 
+		if [ -n "$used_syscalls" ] && ! echo "$name" | grep -qwE "$used_syscalls"; then
+			echo "__SYSCALL($nr, sys_ni_syscall)"
+			nxt=$((nr + 1))
+			continue
+		fi
+
 		if [ "$compat" = "-" ]; then
 			unset compat
 		fi
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
